//
//  ShareViewController.h
//  facebookdemo
//
//  Created by fg on 2015/3/12.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController< UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    UITextField *nicktextField;
    NSMutableArray *totalArray;
    NSArray *shareArray;
    NSArray *nickArray;
    NSArray *editArray;
    BOOL isNickNamePost;
    BOOL isEditting;
    NSString *nickName;
    BOOL isOpen;
    NSString *text;
    NSMutableArray *doShareArray;
    int selectIndex;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
