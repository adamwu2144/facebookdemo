//
//  MemberViewController.h
//  facebookdemo
//
//  Created by fg on 2015/3/20.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
}

@property (weak, nonatomic) IBOutlet UITableView *memberTableView;


@end
