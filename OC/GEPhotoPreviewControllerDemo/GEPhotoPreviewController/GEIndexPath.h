//
//  GEIndexPath.h
//  ExcellentLearning
//
//  Created by hjp on 16/11/28.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GEIndexPath : NSObject
/** indexPath*/
@property (nonatomic , strong , readonly) NSIndexPath *indexPath;
/** select*/
@property (nonatomic , assign) NSInteger selectPage;

@end
