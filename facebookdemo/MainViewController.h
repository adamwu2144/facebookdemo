//
//  MainViewController.h
//  facebookdemo
//
//  Created by fg on 2015/3/10.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "BouncePresentAnimation.h"
#import "ModalViewController.h"
#import "SwipeUpInteractiveTransition.h"

@interface MainViewController : UIViewController<FBLoginViewDelegate,UIPopoverPresentationControllerDelegate,ModalViewControllerDelegate,UIViewControllerTransitioningDelegate>{
    
}

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@property (nonatomic, strong) BouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) SwipeUpInteractiveTransition *transitionController;
//@property (nonatomic, strong) NormalDismissAnimation *dismissAnimation;




-(IBAction)touchShareButton:(id)sender;
- (IBAction)doSelectType:(id)sender;
- (IBAction)shareToWeibo:(id)sender;
- (IBAction)sendRequest:(id)sender;
- (IBAction)modalTest:(id)sender;

@end
