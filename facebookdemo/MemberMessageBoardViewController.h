//
//  MemberMessageBoardViewController.h
//  facebookdemo
//
//  Created by fg on 2015/3/23.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberMessageBoardViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>{
    UISearchBar *userSearchBar;
    
}

@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@end
