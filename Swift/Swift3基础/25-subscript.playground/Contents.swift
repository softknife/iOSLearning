//: Playground - noun: a place where people can play

import UIKit

/*:
 > Script
 在swift中，class, structures 和enum都可以定义subscript，subscript可以帮助我们更方便的访问或者设置一个集合中的某个成员。
 
 下面借助一个官网的实例可以帮助我们更清楚的明白这个功能。
 */

struct Matrix {
    private let rows: Int, columns: Int
    private var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}



/*:
 1.代码定义了一个结构体Matrix，首先，我们通过rows,columns初始化这个结构体
 */

var matrix = Matrix(rows: 4, columns: 4)


/*:
 2.Matrix结构体中定义了一个grid的array，这就使得二维结构体，扁平化
 
 但是，我们如何访问grid数组中的元素那？ grid = [1.0,3.2,4.1,5.0]
 如果直接通过下标来取，例如grid[1],显然这样是不好的，因为不够见名知意！
 此时，我们需要自定义下标来完成！
 */

matrix[0,0] = 1.0
matrix[0,1] = 3.2
matrix[1,0] = 4.1
matrix[1,1] = 5.0

/*
 此时，我们就构建出了一个二维的结构体
 [1.0,3.2
  4.1,5.0]
 */

/*:
 3.我们也可以通过下标来取出每个值
 */

print(matrix[1,0])



/*: 自定义字典
 
 */

enum RequestKey : String {
    
    case code = "code"
    case  nest = "nest"
}

//extension RequestKey : Hashable {
//
//    var hashValue: Int {
//        return rawValue.hashValue
//    }
//
//}

typealias Parameter = [RequestKey:Any]


//extension Dictionary where Key == String{ // 3.1之后就支持这样写了!! 之前需要这样写 Key:ExpressibleByStringLiteral
//
//    subscript( key:RequestKey) -> Value? {
//
//        get {
//            return self[key.rawValue ]
//        }
//
//        set {
//            self[key.rawValue ] = newValue
//        }
//    }
//
//}



let para : Parameter = [.code:"111",.nest:[RequestKey.code:"123"]]

print(para)



