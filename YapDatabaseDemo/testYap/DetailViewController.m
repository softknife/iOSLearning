//
//  DetailViewController.m
//  testYap
//
//  Created by hjp on 17/4/13.
//  Copyright © 2017年 hengqian. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailDataSource.h"
#import <UIImageView+WebCache.h>

@interface DetailViewController ()<DetailDataSourceDelegate>
/** 模型数组*/
@property (nonatomic , strong) DetailDataSource *datasource;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [DetailDataSource dataSouceWithSessionId:self.sessionId delegate:self];
}

#pragma mark - DetailDataSourceDelegate
- (void)detailViewDidReceiveData:(DetailDataSource *)datasource
{
    self.datasource = datasource;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:datasource.avatarPath]];
    self.nameLabel.text = datasource.sessionName;
    self.descriptionLabel.text = datasource.messageDes;
    self.timeLabel.text = datasource.timeString;
    
}

- (void)detailViewUpdateMessageData
{
    self.descriptionLabel.text = self.datasource.messageDes;
    self.timeLabel.text = self.datasource.timeString;
    
}

- (void)detailViewUpdateSessionData
{
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.datasource.avatarPath]];
    self.nameLabel.text = self.datasource.sessionName;
    self.descriptionLabel.text = self.datasource.messageDes;
    self.timeLabel.text = self.datasource.timeString;

}

- (IBAction)touch1:(id)sender
{
    [self.datasource change:1];
}


- (IBAction)touch2:(id)sender
{
    [self.datasource change:2];

}
- (IBAction)touch3:(id)sender {
    
    [self.datasource change:3];
}



@end
