//: Playground - noun: a place where people can play

import UIKit

let array = ["a", "b", "c", "d", "e"]
let arraySlice = array[2..<5]

arraySlice[2]
// 可见，此处索引和OC中的索引不是一回事！它的startIndex 很明显是 2，而不是 0

let first = arraySlice.enumerated().first
print(first)
// 可见，当我们调用 enumerated() 和 first 的时候, 它会返回一个元组，包含了一个offset，值为 0，以及它的第一个元素 “c”。


// 所以，最后结果就是：
// arraySlice[0]  fatal error: Index out of bounds


/**:
 下面举例说明，enumerated()问题！
 */

class ViewController {
    var number : String?
    
}


let produceVCs : () -> [ViewController] = {

    var array = [ViewController]()
    for _ in 0...10 {
        
        let vc = ViewController()
        array.append(vc)
    }
    
    return array
}

let vcs = produceVCs()



// 我见到 enumerated() 最常用的方式是对一个数组执行 enumerated，使用返回的 offset 来获取另一个数组对应的元素。
for (offset , number)  in arraySlice.enumerated() {
    print(offset ,number)
    
    let vc = vcs[offset]
    
    vc.number = number
}

// 虽然这段代码可以正常运作，但前提是 models 和 viewControllers 都是 Array 类型，使用整型来作为索引值类型，从 0 开始。另一个前提是这两个数组拥有相同的长度。如果models 的数组长度比 viewControllers 长的话，就会崩溃。我们还多了一个没有实际意义的多余的变量 offset。

/**:
 那么我们有没有更简洁，安全的方法那？
 使用zip
 */

for (number,viewController) in zip(arraySlice, vcs) {
    viewController.number = number
}

