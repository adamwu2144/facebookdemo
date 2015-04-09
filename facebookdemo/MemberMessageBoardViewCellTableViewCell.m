//
//  MemberMessageBoardViewCellTableViewCell.m
//  facebookdemo
//
//  Created by fg on 2015/3/23.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "MemberMessageBoardViewCellTableViewCell.h"

@implementation MemberMessageBoardViewCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)init{
    self = [super init];
    if(self){
    }
    return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){

    }
    return self;
}

-(void)setMessageBoard{
    [_personImageView setImage:[UIImage imageNamed:@"image.png"]];
    CALayer *layer = [_personImageView layer];
    [layer setCornerRadius:5.0f];
    [layer setMasksToBounds:YES];
    
    [_userNameLabel setText:@"FG小編"];
    [_userNameLabel setTextAlignment:NSTextAlignmentLeft];
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    time = [dateFormatter stringFromDate:[NSDate date]];
    [_timeLabel setText:time];
    [_timeLabel setTextAlignment:NSTextAlignmentLeft];
    [_timeLabel setFont:[UIFont systemFontOfSize:12.0f]];
    
    [_messageLabel setText:@"ＯＫＯＫＯＫ"];
    [_messageLabel setTextAlignment:NSTextAlignmentLeft];
}

-(void)drawRect:(CGRect)rect{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    CGContextFillRect(context, rect);
//    
//    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
//    CGContextFillRect(context, CGRectMake(5, rect.size.height, rect.size.width-10, 1));
    
}

@end
