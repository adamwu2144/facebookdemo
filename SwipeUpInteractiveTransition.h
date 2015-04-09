//
//  SwipeUpInteractiveTransition.h
//  facebookdemo
//
//  Created by fg on 2015/4/2.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController*)viewController;
@end
