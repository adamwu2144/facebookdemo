//
//  AppDelegate.m
//  facebookdemo
//
//  Created by fg on 2015/3/10.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "SelectPostTypeViewController.h"
#import "ShareViewController.h"
#import "WeiboSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [FBLoginView class];
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:@"3844849495"];

    [FBProfilePictureView class];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:mainViewController];

//    selectPostTypeViewController = [[SelectPostTypeViewController alloc] initWithNibName:@"SelectPostTypeViewController" bundle:nil];
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:selectPostTypeViewController];
    
//    shareViewController = [[ShareViewController alloc] initWithNibName:@"ShareViewController" bundle:nil];
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:shareViewController];
    
    [self.window setRootViewController:navi];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    [FBAppEvents activateApp];
//    [[FBSession activeSession] handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    // attempt to extract a token from the url
//    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    
    if( [[url scheme] isEqualToString:@"fb163454450405499"]){
        BOOL urlWasHandled = [FBAppCall handleOpenURL:url
                                    sourceApplication:sourceApplication
                                      fallbackHandler:^(FBAppCall *call) {
                                          NSLog(@"Unhandled deep link: %@", url);
                                          // Here goes the code to handle the links
                                          // Use the links to show a relevant view of your app to the user
                                      }];
        
        return urlWasHandled;
//        return NO;
    }
    else{
        return [WeiboSDK handleOpenURL:url delegate:self];
    }
}
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request{
        
}

    
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class]){
        NSString *title = NSLocalizedString(@"发送结果", nil);
        NSString *message = [NSString stringWithFormat:@"%@: %d\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode, NSLocalizedString(@"响应UserInfo数据", nil), response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil),response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                  otherButtonTitles:nil];
        WBSendMessageToWeiboResponse* sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse*)response;
        NSString* accessToken = [sendMessageToWeiboResponse.authResponse accessToken];
        if (accessToken){
//            self.wbtoken = accessToken;
            NSLog(@"accessToken:%@",accessToken);
        }
        NSString* userID = [sendMessageToWeiboResponse.authResponse userID];
        if (userID) {
//            self.wbCurrentUserID = userID;
            NSLog(@"userID:%@",userID);

        }
        [alert show];
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class]){
        NSString *title = NSLocalizedString(@"认证结果", nil);
        NSString *message = [NSString stringWithFormat:@"%@: %d\nresponse.userId: %@\nresponse.accessToken: %@\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken],  NSLocalizedString(@"响应UserInfo数据", nil), response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil), response.requestUserInfo];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
//                                                            message:message
//                                                           delegate:nil
//                                                  cancelButtonTitle:NSLocalizedString(@"确定", nil)
//                                                  otherButtonTitles:nil];
        
//        self.wbtoken = [(WBAuthorizeResponse *)response accessToken];
//        self.wbCurrentUserID = [(WBAuthorizeResponse *)response userID];
        NSLog(@"accessToken = %@",[(WBAuthorizeResponse *)response accessToken]);
        NSLog(@"userID = %@",[(WBAuthorizeResponse *)response userID]);
        NSString *accessToken = [NSString stringWithFormat:@"%@",[(WBAuthorizeResponse *)response accessToken]];
        NSString *userID = [NSString stringWithFormat:@"%@",[(WBAuthorizeResponse *)response userID]];

        
//        [alert show];
        
        [self getUserInfo:accessToken userid:userID];
    }
    else if ([response isKindOfClass:WBPaymentResponse.class]){
        NSString *title = NSLocalizedString(@"支付结果", nil);
        NSString *message = [NSString stringWithFormat:@"%@: %d\nresponse.payStatusCode: %@\nresponse.payStatusMessage: %@\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode,[(WBPaymentResponse *)response payStatusCode], [(WBPaymentResponse *)response payStatusMessage], NSLocalizedString(@"响应UserInfo数据", nil),response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil), response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                  otherButtonTitles:nil];
        [alert show];
    }
}

- (void)getUserInfo:(NSString *)token userid:(NSString *)id
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:id  forKey:@"uid"];
    //注意此处需要使用get方式获取
    [WBHttpRequest requestWithAccessToken:token url:@"https://api.weibo.com/2/users/show.json" httpMethod:@"GET" params:dict delegate:self withTag:@"userinfo"];
}

#pragma mark -新浪获取用户资料回调方法
- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
    //返回账户信息的字符串

    NSString *jsonString = result;
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"id = %@",[json objectForKey:@"id"]);
    NSLog(@"%@",result);
    
}


@end
