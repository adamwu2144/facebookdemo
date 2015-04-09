//
//  MainViewController.m
//  facebookdemo
//
//  Created by fg on 2015/3/10.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "MainViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "SelectPostTypeViewController.h"
#import "ShareViewController.h"
#import "WeiboSDK.h"
#import "MemberViewController.h"
#import "MemberPostViewController.h"
#import "MemberMessageBoardViewController.h"
#import "SendRequest.h"
#import "ModalViewController.h"
#import "SVProgressHUD.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _presentAnimation = [BouncePresentAnimation new];
        _transitionController = [SwipeUpInteractiveTransition new];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    FBLoginView *loginView = [[FBLoginView alloc] init];
    
    loginView.delegate = self;
    
    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 300);
    
    loginView.tag = 31;
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)touchShareButton:(id)sender{
    [self shareFBLink:@"http://www.fashionguide.com.tw" title:@"風尚科技" caption:@"我是cation" description:@"我是描述" picture:@""];
    
    //    NSLog(@"hellpo");
    //
    //    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
    //                                   @"Sharing Tutorial", @"name",
    //                                   @"Build great social apps and get more installs.", @"caption",
    //                                   @"Allow your users to share stories on Facebook from your app using the iOS SDK.", @"description",
    //                                   @"https://developers.facebook.com/docs/ios/share/", @"link",
    //                                   @"http://i.imgur.com/g3Qc1HN.png", @"picture",
    //                                   nil];
    //
    //    // Make the request
    //    [FBRequestConnection startWithGraphPath:@"/me/feed"
    //                                 parameters:params
    //                                 HTTPMethod:@"POST"
    //                          completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
    //                              if (!error) {
    //                                  // Link posted successfully to Facebook
    //                                  NSLog(@"result: %@", result);
    //                              } else {
    //                                  // An error occurred, we need to handle the error
    //                                  // See: https://developers.facebook.com/docs/ios/errors
    //                                  NSLog(@"%@", error.description);
    //                              }
    //                          }];
    
    
    //    FBLinkShareParams *params = [[FBLinkShareParams alloc] init];
    //    params.link = [NSURL URLWithString:@"http://www.fashionguide.com.tw"];
    //
    //    // If the Facebook app is installed and we can present the share dialog
    //    if ([FBDialogs canPresentShareDialogWithParams:params]) {
    //
    //        [FBDialogs presentShareDialogWithLink:params.link
    //                                      handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
    //                                          if(error) {
    //                                              // An error occurred, we need to handle the error
    //                                              // See: https://developers.facebook.com/docs/ios/errors
    //                                              NSLog(@"Error publishing story: %@", error.description);
    //                                          } else {
    //                                              // Success
    //                                              NSLog(@"result %@", results);
    //                                          }
    //                                      }];
    //
    //    } else {
    //        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
    //                                       @"FashionGuide", @"name",
    //                                       @"華­人­第­一­時­尚穿搭!", @"caption",
    //                                       @"FashionGuide 華­人­第­一­時­尚穿搭!oioioioioioi", @"description",
    //                                       @"http://www.fashionguide.com.tw", @"link",
    //                                       nil];
    //
    //        // Show the feed dialog
    //        [FBWebDialogs presentFeedDialogModallyWithSession:nil
    //                                               parameters:params
    //                                                  handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
    //                                                      if (error) {
    //                                                          // An error occurred, we need to handle the error
    //                                                          // See: https://developers.facebook.com/docs/ios/errors
    //                                                          NSLog(@"Error publishing story: %@", error.description);
    //                                                      } else {
    //                                                          if (result == FBWebDialogResultDialogNotCompleted) {
    //                                                              // User cancelled.
    //                                                              NSLog(@"User cancelled.");
    //                                                          } else {
    //                                                              // Handle the publish feed callback
    //                                                              NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
    //
    //                                                              if (![urlParams valueForKey:@"post_id"]) {
    //                                                                  // User cancelled.
    //                                                                  NSLog(@"User cancelled.");
    //
    //                                                              } else {
    //                                                                  // User clicked the Share button
    //                                                                  NSString *result = [NSString stringWithFormat: @"Posted story, id: %@", [urlParams valueForKey:@"post_id"]];
    //                                                                  NSLog(@"result %@", result);
    //                                                              }
    //                                                          }
    //                                                      }
    //                                                  }];
    //    }
}

- (IBAction)doSelectType:(id)sender {
    //    SelectPostTypeViewController *selectPostTypeViewController = [[SelectPostTypeViewController alloc] initWithNibName:@"SelectPostTypeViewController" bundle:nil];
    //
    //    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:selectPostTypeViewController];
    //
    //    [self.navigationController presentViewController:navi animated:YES completion:nil];
    
    ////
    
    //    ShareViewController *shareViewController = [[ShareViewController alloc] initWithNibName:@"ShareViewController" bundle:nil];
    //
    //    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:shareViewController];
    //
    //    [self.navigationController presentViewController:navi animated:YES completion:nil];
    
    ////
    
    //    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    //    request.redirectURI = @"http://www.sina.com";
    //    request.scope = @"all";
    //    request.userInfo = nil;
    //    [WeiboSDK sendRequest:request];
    
    ////
    
    //        MemberViewController *memberViewController = [[MemberViewController alloc] initWithNibName:@"MemberViewController" bundle:nil];
    //
    //        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:memberViewController];
    //
    //        [self.navigationController presentViewController:navi animated:YES completion:nil];
    
    ////
    
    //    MemberPostViewController *memberPostViewController = [[MemberPostViewController alloc] initWithNibName:@"MemberPostViewController" bundle:nil];
    //
    //    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:memberPostViewController];
    //
    //    [self.navigationController presentViewController:navi animated:YES completion:nil];
    
    ////
    
    //    MemberMessageBoardViewController *memberMessageBoardViewController = [[MemberMessageBoardViewController alloc] initWithNibName:@"MemberMessageBoardViewController" bundle:nil];
    //
    //    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:memberMessageBoardViewController];
    //
    //    [self.navigationController presentViewController:navi animated:YES completion:nil];
    
}

- (IBAction)shareToWeibo:(id)sender {
    [WBProvideMessageForWeiboResponse responseWithMessage:[self messageToShare]];
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:[self messageToShare]];
    request.userInfo = nil;
    
    [WeiboSDK sendRequest:request];
    
}

- (IBAction)sendRequest:(id)sender {
//    [SendRequest sendASynRequestPost:@"http://data.taipei.gov.tw/opendata/apply/query/QzhBMEJFOTctMEEzRC00M0Q2LThDNDktNDVCNDc3NDNDRDBC?$format=json" postString:nil];
    [SVProgressHUD show];
//    [SendRequest sendAsynRequestGet:@"http://data.taipei.gov.tw/opendata/apply/query/QzhBMEJFOTctMEEzRC00M0Q2LThDNDktNDVCNDc3NDNDRDBC?$format=json" callback:^(NSURLResponse *response, NSData *data, NSError *error){
//        
////        if([data length] > 0 && connectionError == nil){
////            
////            NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
////            
////            NSArray *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
////            
////            NSLog(@"resuleAsy = %@",result);
////            NSLog(@"jsonDict = %@",jsonDict);
////            
////            dispatch_async(dispatch_get_main_queue(), ^{
////                NSLog(@"resuleAsy2 = %@",result);
////                NSLog(@"jsonDict2 = %@",jsonDict);
////                
////            });
////            
////        }else if([data length] == 0 && connectionError == nil){
////            
////        }
////        else if(connectionError != nil ){
////            
////        }
//     
//        NSLog(@"%@",data);
//        NSLog(@"oioioi");
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [SVProgressHUD dismiss];
//            
//        });
//
//
//        
//     }];
    [SendRequest loadData:@"http://data.taipei.gov.tw/opendata/apply/query/QzhBMEJFOTctMEEzRC00M0Q2LThDNDktNDVCNDc3NDNDRDBC?$format=json"];
    
    
}

- (IBAction)modalTest:(id)sender {
    
    ModalViewController *mvc =  [[ModalViewController alloc] init];
    mvc.transitioningDelegate = self;
    mvc.delegate =self;
    [self.transitionController wireToViewController:mvc];
    [self presentViewController:mvc animated:YES completion:nil];

}

//-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
//{
//    return self.dismissAnimation;
//}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}

-(void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - loginViewDelegate

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    NSLog(@"access token:%@",    [[FBSession activeSession] accessTokenData]);
    self.profilePictureView.profileID = user.objectID;
    NSLog(@"objectID = %@",user.objectID);

    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",user.objectID]]]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 400, 130, 130)];
    
    [imageView setImage:image];
    
    [self.view addSubview:imageView];
    
    NSString *username = user.name;
    [self.nameLabel setFrame:CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y, username.length, self.nameLabel.frame.size.height)];
    self.nameLabel.text = user.name;
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    self.statusLabel.text= @"You're logged in as";
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    self.profilePictureView.profileID = nil;
    self.nameLabel.text = @"";
    self.statusLabel.text= @"You're not logged in!";
}

#pragma mark - 消息的封装
- (WBMessageObject *)messageToShare{
    WBMessageObject *message = [WBMessageObject message];
    message.text = @"测试通过WeiboSDK发送文字到微博!";
        
        //下面注释的是发送图片和媒体文件
        //    if (self.imageSwitch.on)
        //    {
        //        WBImageObject *image = [WBImageObject object];
        //        image.imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_1" ofType:@"jpg"]];
        //        message.imageObject = image;
        //    }
        //
        //    if (self.mediaSwitch.on)
        //    {
        //        WBWebpageObject *webpage = [WBWebpageObject object];
        //        webpage.objectID = @"identifier1";
        //        webpage.title = @"分享网页标题";
        //        webpage.description = [NSString stringWithFormat:@"分享网页内容简介-%.0f", [[NSDate date] timeIntervalSince1970]];
        //        webpage.thumbnailData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_2" ofType:@"jpg"]];
        //        webpage.webpageUrl = @"http://sina.cn?a=1";
        //        message.mediaObject = webpage;
        //    }
        
    return message;
}

- (void)shareFBLink:(NSString *)alink title:(NSString *)aTitle caption:(NSString *)aCaption description:(NSString *)aDescription picture:(NSString *)aPicture {
    
    NSURL *pictureUrl;
    if([aPicture isEqualToString:@""]){
        pictureUrl = nil;
    }
    else{
        pictureUrl = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@",aPicture]];
    }
    
    FBLinkShareParams *params = [[FBLinkShareParams alloc] initWithLink:[NSURL URLWithString:[NSString stringWithFormat:@"%@",alink]] name:aTitle caption:aCaption description:aDescription picture:pictureUrl];
    //如果用戶端已安裝facebook app 即使用app的dialog分享貼文
    if([FBDialogs canPresentShareDialogWithParams:params]){
        [FBDialogs presentShareDialogWithLink:params.link name:params.name caption:params.caption description:params.description picture:params.picture clientState:nil handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
            if(error){
                //失敗
                NSLog(@"Error publishing story:%@",error.description);
            }
            else{
                //成功
                NSLog(@"result:%@",results);
            }
        }];
    }
    //如果用戶端未安裝facebook app 即使用web方式分享貼文
    else{
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:aTitle, @"name", aCaption, @"caption", aDescription, @"description", alink, @"link", nil];
        
        // Show the feed dialog
        [FBWebDialogs presentFeedDialogModallyWithSession:nil parameters:params handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error){
            if (error) {
                NSLog(@"Error publishing story: %@", error.description);
            }
            else {
                if (result == FBWebDialogResultDialogNotCompleted) {
                                                              // User cancelled.
                    NSLog(@"User cancelled.");
                }
                else {
                    // Handle the publish feed callback
                    NSString *resultQuary = [resultURL query];
                    NSArray *pairs = [resultQuary componentsSeparatedByString:@"&"];
                    NSMutableDictionary *resultParams = [[NSMutableDictionary alloc] init];
                    for (NSString *pair in pairs) {
                        NSArray *kv = [pair componentsSeparatedByString:@"="];
                        NSString *val =
                        [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                        resultParams[kv[0]] = val;
                    }
                    NSDictionary *urlParams = resultParams;
                                                              
                    if (![urlParams valueForKey:@"post_id"]) {
                        // User cancelled.
                        NSLog(@"User cancelled.");                                              
                    }
                    else {
                        // User clicked the Share button
                        NSString *result = [NSString stringWithFormat: @"Posted story, id: %@", [urlParams valueForKey:@"post_id"]];
                        NSLog(@"result %@", result);
                    }
                }
            }
        }];
    }
}

@end
