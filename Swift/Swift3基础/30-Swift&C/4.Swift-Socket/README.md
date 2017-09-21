

> <http://www.cnblogs.com/lzjsky/archive/2013/03/18/2965983.html>



### 一.Socket简介

 

在UNIX系统中,万物皆文件(Everything is a file)。所有的IO操作都可以看作对文件的IO操作，都遵循着这样的操作模式:打开 -> 读/写 -> 关闭，打开操作（如open函数）获取“文件”使用权，返回文件描述符，后继的操作都通过这个文件描述符来进行。很多系统调用都依赖于文件描述符,它是一个**无符号整数**，每一个用户进程都对应着一个文件描述符表，通过文件描述符就可以找到对应文件的信息。 

在类UNIX平台上，对于控制台的标准输入输出以及标准错误输出都有对应的文件描述符，分别为0,1,2。它们定义在 unistd.h中

```swift
#define  STDIN_FILENO   0   /* standard input file descriptor */  
#define STDOUT_FILENO   1   /* standard output file descriptor */  
#define STDERR_FILENO   2   /* standard error file descriptor */     

```



UNIX内核加入TCP/IP协议的时候，便在系统中引入了一种新的IO操作，只不过由于网络连接的不可靠性，所以网络IO比本地设备的IO复杂很多。这一系列的接口叫做BSD Socket API,当初由伯克利大学研发，最终成为网络开发接口的标准。**网络通信从本质上讲也是进程间通信，只是这两个进程一般在网络中不同计算机上**。当然Socket API其实也提供了专门用于本地IPC的使用方式：UNIX Domain Socket，这个这里就不细说了。本文所讲的Socket如无例外，均是说的Internet Socket。



在本地的进程中，每一个进程都可以通过PID(process id)来标识，对于网络上的一个计算机中的进程如何标识呢？网络中的计算机可以通过一个IP地址进行标识，一个计算机中的某个进程则可以通过一个无符号整数（端口号）来标识，所以一个网络中的进程可以通过IP地址+端口号的方式进行标识。





******

### 二.BSD Socket编程准备



**1.地址**

在程序中，我们如何保存一个地址呢？在 <sys/socket.h>中的sockaddr便是描述socket地址的结构体类型.

```swift
/* 
* [XSI] Structure used by kernel to store most addresses. 
*/  
struct sockaddr {  
    __uint8_t   sa_len;     /* total length */  
    sa_family_t sa_family;  /* [XSI] address family */  
    char        sa_data[14];    /* [XSI] addr value (actually larger) */  
};  
```





为了方便设置用语网络通信的socket地址，引入了sockaddr_in结构体（对于UNIX Domain Socket则对应sockaddr_un）

```swift
/* 
 * Socket address, internet style. 
 */  
struct sockaddr_in {  
    __uint8_t   sin_len;  
    sa_family_t sin_family;  
    in_port_t   sin_port;//得是网络字节序  
    struct  in_addr sin_addr;//in_addr存在的原因则是历史原因，其实质是代表一个IP地址的32位整数  
    char        sin_zero[8];//bzero之，纯粹是为了兼容sockaddr  
};  
```



在实际编程的时候，经常需要将sockaddr_in强制转换成sockaddr类型。



**2.端口**

说到端口我们经常会联想到硬件，在网络编程中的端口其实是一个标识而已，或者说是系统的资源而已。系统提供了端口分配和管理的机制。



**3.网络字节序**

谈网络字节序(Endianness)之前我们先说说什么是字节序。字节序又叫端序，就是指计算机中存放 多字节数据的字节的顺序。典型的就是数据存放在内存中或者网络传输时的字节的顺序。常用的字节序有大端序(big-endian)，小端序(litle-endian,另还有不常见的混合序middle-endian)。不同的CPU可能会使用不同的字节序，如X86，PDP-11等处理器为小端序，Motorola 6800,PowerPC 970等使用的是大端序。小端序是指低字节位存放在内存地址的低端，高端序是指高位字节存放在内存的低端。 举个例子来说明什么是大端序和小端序： 比如一个4字节的整数 16进制形式为 0x12345678，最左边是高位。



大端序

| **低位** | **> >** | **> >** | **高位** |
| ------ | ------- | ------- | ------ |
| 12     | 34      | 56      | 78     |

小端序

| **低位** | **> >** | **> >** | **高位** |
| ------ | ------- | ------- | ------ |
| 78     | 56      | 34      | 12     |



TCP/IP 各层协议将字节序使用的是大端序，我们把TCP/IP协议中使用的字节序称之为网络字节序。 编程的时候可以使用定义在sys/_endian.h中的相关的接口进行本地字节序和网络字节序的互转。

```swift
#define ntohs(x)    __DARWIN_OSSwapInt16(x) // 16位整数 网络字节序转主机字节序  
#define htons(x)    __DARWIN_OSSwapInt16(x) // 16位整数 主机字节序转网络字节序  
  
#define ntohl(x)    __DARWIN_OSSwapInt32(x)  //32位整数 网络字节序转主机字节序  
#define htonl(x)    __DARWIN_OSSwapInt32(x) //32位整数 主机字节序转网络字节序 
```

*以上声明中 n代表netwrok， h代表host ，s代表short，l代表long*

如果数据是单字节的话，则其没有字节序的说法了。



**4.半相关与全相关**

半相关（half-association）是指一个三元组 (协议,本地IP地址,本地端口),通过这个三元组就可以唯一标识一个网络中的进程,一般用于listening socket。但是实际进行通信的过程，至少需要两个进程，且它们所使用的协议必须一致，所以一个完成的网络通信至少需要一个五元组表示(协议,本地地址,本地端口,远端地址,远端端口)，这样的五元组叫做全相关。



**5.网络编程模型**

网络存在的本质其实就是网络中个体之间的在某个领域的信息存在不对等性，所以一般情况下总有一些个体为另一些个体提供服务。提供服务器的我们把它叫做服务器，接受服务的叫做客户端。所以在网络编程中，也存在服务器端和客户端之分。



| **服务器端**                             | **客户端**                                  |
| ------------------------------------ | ---------------------------------------- |
| 创建Socket                             | -                                        |
| 将Socket和本地的地址端口绑定                    | -                                        |
| 开始进行侦听                               | 创建一个Socket和服务器的地址并通过它们向服务器发送连接请求         |
| 握手成功，接受请求，得到一个新的Socket，通过它可以和客户端进行通信 | 连接成功，客户端的Socket会绑定到系统分配的一个端口上，并可以通过它和服务器端进行通信 |





******

### 三.BSD Socket编程详解



下面的例子是一个简单的一对一聊天的程序，分服务器和客户端，且发送消息和接受消息次序固定。

**Server端代码**

```swift
#include <stdio.h>  
#include <netinet/in.h>  
#include <sys/socket.h>  
#include <arpa/inet.h>  
#include <string.h>  
  
int main (int argc, const char * argv[])  
{  
    struct sockaddr_in server_addr;  
    server_addr.sin_len = sizeof(struct sockaddr_in);  
    server_addr.sin_family = AF_INET;//Address families AF_INET互联网地址簇  
    server_addr.sin_port = htons(11332);  
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");  
    bzero(&(server_addr.sin_zero),8);  
  
    //创建socket  
    int server_socket = socket(AF_INET, SOCK_STREAM, 0);//SOCK_STREAM 有连接  
    if (server_socket == -1) {  
        perror("socket error");  
        return 1;  
    }  
  
    //绑定socket：将创建的socket绑定到本地的IP地址和端口，此socket是半相关的，只是负责侦听客户端的连接请求，并不能用于和客户端通信  
    int bind_result = bind(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr));  
    if (bind_result == -1) {  
        perror("bind error");  
        return 1;  
    }  
  
    //listen侦听 第一个参数是套接字，第二个参数为等待接受的连接的队列的大小，在connect请求过来的时候,完成三次握手后先将连接放到这个队列中，直到被accept处理。如果这个队列满了，且有新的连接的时候，对方可能会收到出错信息。  
    if (listen(server_socket, 5) == -1) {  
        perror("listen error");  
        return 1;  
    }  
  
    struct sockaddr_in client_address;  
    socklen_t address_len;  
    int client_socket = accept(server_socket, (struct sockaddr *)&client_address, &address_len);  
    //返回的client_socket为一个全相关的socket，其中包含client的地址和端口信息，通过client_socket可以和客户端进行通信。  
    if (client_socket == -1) {  
        perror("accept error");  
        return -1;  
    }  
  
    char recv_msg[1024];  
    char reply_msg[1024];  
  
    while (1) {  
        bzero(recv_msg, 1024);  
        bzero(reply_msg, 1024);  
  
        printf("reply:");  
        scanf("%s",reply_msg);  
        send(client_socket, reply_msg, 1024, 0);  
  
        long byte_num = recv(client_socket,recv_msg,1024,0);  
        recv_msg[byte_num] = '\0';  
        printf("client said:%s\n",recv_msg);  
  
    }  
  
    return 0;  
}  
```



**Client端代码**

```swift
#include <stdio.h>  
#include <netinet/in.h>  
#include <sys/socket.h>  
#include <arpa/inet.h>  
#include <string.h>  
  
int main (int argc, const char * argv[])  
{  
    struct sockaddr_in server_addr;  
    server_addr.sin_len = sizeof(struct sockaddr_in);  
    server_addr.sin_family = AF_INET;  
    server_addr.sin_port = htons(11332);  
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");  
    bzero(&(server_addr.sin_zero),8);  
  
    int server_socket = socket(AF_INET, SOCK_STREAM, 0);  
    if (server_socket == -1) {  
        perror("socket error");  
        return 1;  
    }  
    char recv_msg[1024];  
    char reply_msg[1024];  
  
    if (connect(server_socket, (struct sockaddr *)&server_addr, sizeof(struct sockaddr_in))==0)     {  
    //connect 成功之后，其实系统将你创建的socket绑定到一个系统分配的端口上，且其为全相关，包含服务器端的信息，可以用来和服务器端进行通信。  
        while (1) {  
            bzero(recv_msg, 1024);  
            bzero(reply_msg, 1024);  
            long byte_num = recv(server_socket,recv_msg,1024,0);  
            recv_msg[byte_num] = '\0';  
            printf("server said:%s\n",recv_msg);  
  
            printf("reply:");  
            scanf("%s",reply_msg);  
            if (send(server_socket, reply_msg, 1024, 0) == -1) {  
                perror("send error");  
            }  
        }  
  
    }  
  
    // insert code here...  
    printf("Hello, World!\n");  
    return 0;  
}  
```



上面的服务器端和客户端连接成功之后打开的端口的情况是怎么样的呢？

- 服务器端 ,存在一个用于listen的半相关的socket，一个用于和客户端进行通信的全相关的socket 
- 客户端 存在一个用于和服务器端进行通信的全相关的socket 

由于accept只运行了一次，所以服务器端一次只能和一个客户端进行通信，且使用的send和recv方法都是阻塞的，所以上面这个例子存在一个问题就是服务器端客户端连接成功之后，发送，接受，发送，接受的次序就被固定了。比如服务器端发送消息之后就等客户端发送消息了，没有接受到客户端的消息之前服务器端是没有办法发送消息的。使用select这个这个系统调用可以解决上面的问题。





