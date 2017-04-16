//: [Previous](@previous)

import UIKit

/*:
 > # Swift3.1 withoutActuallyEscaping
 - 为了在逃逸闭包中使用非逃逸的闭包,Apple工程师通过一个上述方法,将非逃逸闭包转换成逃逸闭包
 
 -----
 
 -  该函数作用是, 将with中返回的结果作用于array中
 */
func increaseValue(in array:[Int] , with: @autoclosure ()->Int){
    
    // 由于@autoclosure不能用于withoutActuallyEscaping,所以,此处Apple工程师建议我们使用内部临时函数
    func increaseValueTmp(in array:[Int] , with: ()->Int ){
    
        withoutActuallyEscaping(with) { escapedWith in
            
            // 此处lazy的作用在于能懒加载执行下面map中的代码,直到print中访问increasedArray中的元素时
            let increasedArray = array.lazy.map{ $0 + escapedWith()}
            
            // some processing here
            
            print(increasedArray.first)
            print(increasedArray[1])
            
            
        }
    }
    
    increaseValueTmp(in: array, with: with)
}


increaseValue(in: [1,2,5,22], with: 1 + 2)






//: [Next](@next)