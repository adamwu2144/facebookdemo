//
//  HcCustomKeyboard.h
//  Custom
//
//  Created by fg on 15/3/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol HcCustomKeyboardDelegate <NSObject>

@required
-(void)talkBtnClick:(UITextView *)textViewGet;

@end

@interface HcCustomKeyboard : NSObject<UITextViewDelegate>{
    BOOL isTouch;
    CGRect _keyboardRect;
}

@property (nonatomic,assign) id<HcCustomKeyboardDelegate>mDelegate;
@property (nonatomic,strong)UIView *mBackView;
@property (nonatomic,strong)UIView *optionView;
@property (nonatomic,strong)UIView *mTopHideView;
@property (nonatomic,strong)UITextView * mTextView;
@property (nonatomic,strong)UIView *mHiddeView;
@property (nonatomic,strong)UIViewController *mViewController;
@property (nonatomic,strong)UIView *mSecondaryBackView;
@property (nonatomic,strong)UIButton *mTalkBtn;
@property (nonatomic,strong)UIButton *mPlusBtn;
@property (nonatomic,strong)UITableView *detailTableView;
@property (nonatomic) BOOL isTop;//用来判断评论按钮的位置

+(HcCustomKeyboard *)customKeyboard;

-(void)textViewShowView:(UIViewController *)viewController customKeyboardDelegate:(id)delegate tableView:(UITableView *)aTableView;



@end

