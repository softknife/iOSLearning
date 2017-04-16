//: Playground - noun: a place where people can play

import UIKit

let newArray = [1,2,nil,3].flatMap { $0}
                          .filter { $0 <= 2}
                         .map { $0 * 2 }

print(newArray)