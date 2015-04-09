//
//  MemberPostViewCellTableViewCell.m
//  facebookdemo
//
//  Created by fg on 2015/3/20.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "MemberPostViewCellTableViewCell.h"

#define StartX 30
#define StartY 20

@implementation MemberPostViewCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(StartX, StartY, 100, 30)];
        [titleLabel setText:@"格雷完食"];
        
        unReadNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(StartX+titleLabel.bounds.size.width, StartY, 30, 30)];
        [unReadNumLabel setText:@"2"];
        [unReadNumLabel setTextColor:[UIColor whiteColor]];
        [unReadNumLabel setTextAlignment:NSTextAlignmentCenter];
        [unReadNumLabel setBackgroundColor:[UIColor redColor]];
        CALayer *layer = [unReadNumLabel layer];
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:15.0f];
        
        visitNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3*2, StartY, 50, 50)];
        [visitNumLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [visitNumLabel setText:@"23訪問"];
        
        joinNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3*2 + 50+StartY, StartY, 50, 50)];
        [joinNumLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [joinNumLabel setText:@"2參與"];
        
        personImageView = [[UIImageView alloc] initWithFrame:CGRectMake(StartX, StartY*2+30, 50, 50)];
        [personImageView setImage:[UIImage imageNamed:@"image.png"]];
        layer = [personImageView layer];
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:5.0f];
        
        personNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(StartX+StartY+50, StartY*2+30, 70, 30)];
        [personNameLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [personNameLabel setText:@"orange橙子"];
        
        messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(StartX+StartY+50+70+StartY, StartY*2+30, 100, 50)];
        [messageLabel setText:@"好看"];
        
        messageTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(StartX+StartY+50+30+StartY+100+StartY, StartY*2+30, 100, 50)];
        [messageTimeLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [messageTimeLabel setText:@"1小時前"];
        
        [self.contentView addSubview:titleLabel];
        [self.contentView addSubview:unReadNumLabel];
        [self.contentView addSubview:visitNumLabel];
        [self.contentView addSubview:joinNumLabel];
        [self.contentView addSubview:personImageView];
        [self.contentView addSubview:personNameLabel];
        [self.contentView addSubview:messageLabel];
        [self.contentView addSubview:messageTimeLabel];

        
    }
    return self;
}



@end
