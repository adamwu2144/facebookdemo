//
//  SelectPostTypeViewController.h
//  facebookdemo
//
//  Created by fg on 2015/3/12.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectPostTypeViewController : UIViewController{
    NSArray *lifeArray;
    int selectIndex;
    CGRect subViewFrame;
    
}

@property (weak, nonatomic) IBOutlet UIButton *fashionButton;
@property (weak, nonatomic) IBOutlet UIButton *beautyButton;
@property (weak, nonatomic) IBOutlet UIButton *lifeButton;
@property (weak, nonatomic) IBOutlet UIView *fashionContentView;
@property (weak, nonatomic) IBOutlet UIView *beautyContentView;
@property (weak, nonatomic) IBOutlet UIView *lifeContentView;


- (IBAction)doSelectFashion:(id)sender;
- (IBAction)doSelectBeauty:(id)sender;
- (IBAction)doSelectlife:(id)sender;

@end
