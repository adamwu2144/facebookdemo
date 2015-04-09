//
//  MemberPostViewCellTableViewCell.h
//  facebookdemo
//
//  Created by fg on 2015/3/20.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberPostViewCellTableViewCell : UITableViewCell{
    UILabel *titleLabel;
    UILabel *unReadNumLabel;
    UILabel *visitNumLabel;
    UILabel *joinNumLabel;
    UIImageView *personImageView;
    UILabel *personNameLabel;
    UILabel *messageLabel;
    UILabel *messageTimeLabel;
}

@end
