//
//  FileTool.swift
//  3-抛出异常2
//
//  Created by 黄继平 on 2016/11/20.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

enum FileError:Error{
    case nameInvalid
    case pathInvalid
    case dataInvalid
    case stringInvalid

}

class FileTool: NSObject {
    
    
    class func getFileTextContentWithName(_ fileName:String) throws -> String? {
        
        if fileName == "" {
            throw FileError.nameInvalid

        }

        guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {
            throw FileError.pathInvalid
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            throw FileError.dataInvalid
        }
        

        guard let result = String(data: data, encoding: .utf8) else {
            throw FileError.stringInvalid
        }
        
        return result
    }
}
