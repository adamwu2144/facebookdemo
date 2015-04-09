//
//  MCMessageBoardDetailViewController.m
//  facebookdemo
//
//  Created by fg on 2015/3/23.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "MCMessageBoardDetailViewController.h"
#import "HcCustomKeyboard.h"

@interface MCMessageBoardDetailViewController ()

@end

@implementation MCMessageBoardDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:[NSString stringWithFormat:@"%d",selectIndex]];
    [self.view setBackgroundColor:[UIColor redColor]];
    [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [[HcCustomKeyboard customKeyboard] textViewShowView:self customKeyboardDelegate:self tableView:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil index:(int)aIndex{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        selectIndex = aIndex;
    }
    return self;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
    return cell;
}

#pragma mark - HcCustomKeyBoardDelegate

-(void)talkBtnClick:(UITextView *)textViewGet{
    NSLog(@"%@",textViewGet.text);
}


@end
