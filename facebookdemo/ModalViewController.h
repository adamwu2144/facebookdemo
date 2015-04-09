//
//  ModalViewController.h
//  facebookdemo
//
//  Created by fg on 2015/4/2.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BouncePresentAnimation.h"

@class ModalViewController;

@protocol ModalViewControllerDelegate <NSObject>

@required
-(void) modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController;

@end

@interface ModalViewController : UIViewController{
    
}

@property (nonatomic, weak) id<ModalViewControllerDelegate> delegate;

@end
