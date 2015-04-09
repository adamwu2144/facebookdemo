//
//  AppDelegate.h
//  facebookdemo
//
//  Created by fg on 2015/3/10.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"


@class MainViewController , SelectPostTypeViewController , ShareViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate, WBHttpRequestDelegate>{
    MainViewController *mainViewController;
    SelectPostTypeViewController *selectPostTypeViewController;
    ShareViewController *shareViewController;
}

@property (strong, nonatomic) UIWindow *window;


@end

