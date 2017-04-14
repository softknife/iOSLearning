//
//  AusomeCell.m
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import "AusomeCell.h"
#import "Manager.h"
#import <UIImageView+WebCache.h>
#import "Ausome.h"

NSString *const ausomeCell = @"ausomeCell";

@interface AusomeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *unreadCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
@implementation AusomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAusome:(Ausome *)ausome
{
    _ausome = ausome;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:ausome.avatarPath]];
    self.nameLabel.text = ausome.sessionName;
    self.messageLabel.text = ausome.messageDes;
    self.unreadCountLabel.text = ausome.unreadCount;
    self.timeLabel.text = ausome.timeString;//[Manager getTimeString:messageTable.creatTime];
    
}
@end
