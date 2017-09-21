//: Playground - noun: a place where people can play

import UIKit


// 在 Swift 的标准库中，我们还有一组 lazy 方法，它们的定义是这样的：
/*
 func lazy<S : SequenceType>(s: S) -> LazySequence<S>
 
 func lazy<S : CollectionType where S.Index : RandomAccessIndexType>(s: S)
 -> LazyRandomAccessCollection<S>
 
 func lazy<S : CollectionType where S.Index : BidirectionalIndexType>(s: S)
 -> LazyBidirectionalCollection<S>
 
 func lazy<S : CollectionType where S.Index : ForwardIndexType>(s: S)
 -> LazyForwardCollection<S>
 
 
 这些方法可以配合像 map 或是 filter 这类接受闭包并进行运行的方法一起，让整个行为变成延时进行的。在某些情况下这么做也对性能会有不小的帮助。例如，直接使用 map 时：
 */

let range = 1...3 // CountableClosedRange

let result = range.map{ i -> Int in
    print("正在处理range")
    return i * 2
}

print("准备访问结果")
for i in result{
    print("操作后结果为 \(i)")
}

print("操作完成")
/* 执行顺序:
 正在处理range
 准备访问结果
 操作后结果为 2
 操作后结果为 4
 操作后结果为 6
 操作完成
 */

let lazyResult = range.lazy.map{ i -> Int in
    print("lazy-正在处理range")
    return i * 2
}

print("准备访问结果")
for i in lazyResult{
    print("操作后结果为 \(i)")
}

print("操作完成")
/* 执行顺序:
 准备访问结果
 lazy-正在处理range
 操作后结果为 2
 lazy-正在处理range
 操作后结果为 4
 lazy-正在处理range
 操作后结果为 6
 操作完成
 */
// 对于那些不需要完全运行，可能提前退出的情况，使用 lazy 来进行性能优化效果会非常有效。

