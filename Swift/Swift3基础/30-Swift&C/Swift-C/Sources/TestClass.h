//
//  TestClass.h
//  Swift-C
//
//  Created by Apple on 2017/8/28.
//
//

#import <Foundation/Foundation.h>



// 通过地址访问对象
typedef void (* CALLBACK) (void *);
void funcWithCallBack(void * , CALLBACK);

