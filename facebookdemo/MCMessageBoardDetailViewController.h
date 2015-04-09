//
//  MCMessageBoardDetailViewController.h
//  facebookdemo
//
//  Created by fg on 2015/3/23.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HcCustomKeyboard.h"

@interface MCMessageBoardDetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, HcCustomKeyboardDelegate>{
    int selectIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil index:(int)aIndex;

@end
