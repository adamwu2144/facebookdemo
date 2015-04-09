//
//  MemberMessageBoardViewCellTableViewCell.h
//  facebookdemo
//
//  Created by fg on 2015/3/23.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberMessageBoardViewCellTableViewCell : UITableViewCell{
    NSDateFormatter *dateFormatter;
    NSString *time;
}

@property (weak, nonatomic) IBOutlet UIImageView *personImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

-(void) setMessageBoard;
@end
