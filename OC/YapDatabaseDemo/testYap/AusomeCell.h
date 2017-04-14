//
//  AusomeCell.h
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const ausomeCell;

@class Ausome;
@interface AusomeCell : UITableViewCell
/** session*/
@property (nonatomic , strong) Ausome *ausome;
@end
