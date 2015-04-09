//
//  MemberViewCell.m
//  facebookdemo
//
//  Created by fg on 2015/3/20.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "MemberViewCell.h"


#define StartX 30
#define StartY 20

@implementation MemberViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(StartX, StartY, 50, 50)];
        [titleImage setImage:[UIImage imageNamed:@"fashionguide.png"]];
        [self.contentView addSubview:titleImage];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(StartX+50+StartY, StartY, 100, 30)];
        [titleLabel setText:@"FG活動小組"];
        [self.contentView addSubview:titleLabel];
        
        NSString *textString = @"\ue405\ue106新版電價公式上路，電價審議委員會上午開會決定4月以後的新電價，比去年的基準電價每度新台幣3.1139元，降為2.8852元，每度降價0.2287元，降幅約7.34%";
        CGSize size = CGSizeMake(self.frame.size.width,9999);
        UIFont *font = [UIFont boldSystemFontOfSize:15.0f];
        CGSize textRect = [self text:textString sizeWithFont:font constrainedToSize:size];
        NSLog(@"width:%f",self.frame.size.width);
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(StartX, StartY+50+StartY, self.frame.size.width, textRect.height-10)];
        [textLabel setNumberOfLines:0];
        [textLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [textLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [textLabel setTextAlignment:NSTextAlignmentLeft];//對齊
        [textLabel setLineBreakMode:NSLineBreakByTruncatingTail];//省略模式
        [textLabel setText:textString];
        [self.contentView addSubview:textLabel];
        
//        長度處理
//        NSInteger len = [textString length];
//        if(len > 30){
//            NSString *tmp = [textString substringFromIndex:30];
//            NSMutableString *tmpString = [[NSMutableString alloc] initWithString:tmp];
//            [tmpString appendString:@"..."];
//            tmp = tmpString;
//        }
        
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(StartX, StartY+50+StartY+44 + StartY, 50, 30)];
        [timeLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [timeLabel setText:@"一天前"];
        [self.contentView addSubview:timeLabel];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGSize)text:(NSString*)text sizeWithFont:(UIFont*)font {
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName: font}];
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

- (CGSize)text:(NSString*)text sizeWithFont:(UIFont*)font constrainedToSize:(CGSize)size{
    CGRect textRect = [text boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName: font}
                                         context:nil];
    return CGSizeMake(ceilf(textRect.size.width), ceilf(textRect.size.height));
}

@end
