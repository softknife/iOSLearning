//: [Previous](@previous)

import Foundation

/*:
 > # @autoclosure
 - 关键字，是 Swift 引入的一个便捷操作，旨在让我们使用闭包作为参数的时候，更加的方便，简化语法形式，我们就来看看如何使用吧。
 
 ----
 - 首先我们来看一个例子
*/

func filter(_ predicate: ()-> Bool) {

    if predicate() {
     
        // do something
    }else{
    
        // do other thing
    }
    
}

//: 1.使用方式1:
filter { () -> Bool in
    return 2 > 3
}

//: 2.使用方式2, 传入了一个闭包，这里返回 2 > 3 这个表达式的值。当然，我们还可以让这个闭包更加简化一些，闭包默认会把最后一个表示作为返回值，所以 return 关键字可以省略：

filter { 2 > 3 }

/*:
3.使用方式3, 我们可以在方法的参数定义中，使用 @autoclosure 关键字：
 
-  这样，连闭包两边的大括号都省略了，filter 方法自动将这个表达式包装成闭包，这就是 @autoclosure 的作用。
*/

func filter1(_ predicate: @autoclosure ()->Bool){

    if predicate() {
        print("成功")
    }
}

filter1( 2 > 1)


/*:
 ------
 ## 为何要用 @autoclosure?
 
 如果我们将上述方法定义成如下方式也是可以的:
 */

func filter2(_ predicate: Bool) {
    
    if predicate {
        
        print("成功")
        
    } else {
        
        print("失败")
        
    }
    
}

filter2(2 > 1)

/*:
 - @autoclosure 和普通表达式最大的区别就是，普通表达式在传入参数的时候，会马上被执行，然后将执行的结果作为参数传递给函数。
 - 而使用 @autoclosure 标记的参数，虽然我们传入的也是一个表达式，但这个表达式不会马上被执行，而是要由调用的函数内来决定它具体执行的时间。
 
 以我们这个 filter(2 > 3) 中的这个例子来看，如果我们使用的是普通参数，那么 2 > 3 这个表达式会先运算出结果，然后将结果传给 filter 函数。
 
 而如果我们这个参数是 @autoclosure 标记的闭包，那么这个表达式就不会马上执行，而是交给 filter 函数决定什么时候执行这个表达式，或者，根本就不执行它。
 
 这个区别在平常的情况下大家可能不会过多留意，但对于一些比较消耗性能的操作，这个执行机制就会有些影响了。
 
 参考: http://www.tuicool.com/articles/Bz2uIvN
 */



//: [Next](@next)
