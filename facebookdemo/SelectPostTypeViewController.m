//
//  SelectPostTypeViewController.m
//  facebookdemo
//
//  Created by fg on 2015/3/12.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "SelectPostTypeViewController.h"

#define LineButtonCount 3
#define LineButtonSpace 20
#define ButtonTag 100

@interface SelectPostTypeViewController ()

@end

@implementation SelectPostTypeViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        selectIndex = 0;
        lifeArray = [[NSArray alloc] initWithObjects:@"旅遊",@"美食",@"兩性",@"明星",@"3C",@"星座", nil];
        subViewFrame = CGRectZero;
    }
    return self;
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    int buttonWidth = (subViewFrame.size.width-(LineButtonSpace * (LineButtonCount+ 1))) / LineButtonCount ;
    
    NSLog(@"buttonWidth:%d",buttonWidth);
    int startX = (subViewFrame.size.width - (LineButtonCount * buttonWidth) - ((LineButtonCount-1) * LineButtonSpace)) / 2.0f;
    NSLog(@"startX:%d",startX);
    
    for (int x = 0 ; x < [lifeArray count] ; x++){
        int originX = startX + ((buttonWidth + LineButtonSpace) * (x % LineButtonCount));
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(originX, (buttonWidth+LineButtonSpace) * (x / LineButtonCount) + LineButtonSpace, buttonWidth, buttonWidth)];
        [button setTag:x + ButtonTag];
        [button addTarget:self action:@selector(doSelectButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor orangeColor]];
        [button setTitle:[lifeArray objectAtIndex:x] forState:UIControlStateNormal];
        [button.layer setCornerRadius:5];
        [self.lifeContentView addSubview:button];
        
        if ( x == selectIndex){
            [button setSelected:YES];
            [[button layer] setBorderWidth:1.0f];
        }
    }
    int count = (int)[lifeArray count];
    int line = (count % LineButtonCount == 0 ? count / LineButtonCount : (count / LineButtonCount)+1);
    
    UIButton *skipButton = [[UIButton alloc] initWithFrame:CGRectMake(startX, (buttonWidth + LineButtonSpace) * (line) + LineButtonSpace , LineButtonSpace*2 + buttonWidth*LineButtonCount , buttonWidth)];
    [skipButton setTag:6 + ButtonTag];
    [skipButton addTarget:self action:@selector(doSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    [skipButton setBackgroundColor:[UIColor orangeColor]];
    [skipButton setTitle:@"SKIP" forState:UIControlStateNormal];
    [skipButton.layer setCornerRadius:5];
    [self.lifeContentView addSubview:skipButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.beautyContentView setHidden:YES];
    [self.lifeContentView setHidden:YES];
}

-(void)viewDidLayoutSubviews
{
    subViewFrame = self.fashionContentView.frame;
    NSLog(@"x = %f , y = %f , w = %f, h = %f",self.fashionContentView.frame.origin.x,self.fashionContentView.frame.origin.y,self.fashionContentView.frame.size.width,self.fashionContentView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) doSelectButton:(id)sender{
        NSLog(@"x = %f , y = %f , w = %f, h = %f",self.fashionContentView.frame.origin.x,self.fashionContentView.frame.origin.y,self.fashionContentView.frame.size.width,self.fashionContentView.frame.size.height);
    
    UIButton *lastButton = (UIButton *)[_lifeContentView viewWithTag:ButtonTag + selectIndex];
    [lastButton setSelected:NO];
    [[lastButton layer] setBorderWidth:0.0f];
    
    UIButton *button = (UIButton *)sender;
    selectIndex = (int)button.tag - ButtonTag;
    [button setSelected:YES];
    [[button layer] setBorderWidth:1.0f];
//    [button setTitle:[lifeArray objectAtIndex:selectIndex] forState:UIControlStateNormal];
}

- (IBAction)doSelectFashion:(id)sender {
    [self.fashionContentView setHidden:NO];
    [_beautyContentView setHidden:YES];
    [_lifeContentView setHidden:YES];
}

- (IBAction)doSelectBeauty:(id)sender {
    [_beautyContentView setHidden:NO];
    [self.fashionContentView setHidden:YES];
    [_lifeContentView setHidden:YES];
}

- (IBAction)doSelectlife:(id)sender {
    [_lifeContentView setHidden:NO];
    [self.fashionContentView setHidden:YES];
    [_beautyContentView setHidden:YES];
}

@end
