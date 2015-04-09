//
//  HcCustomKeyboard.h
//  Custom
//
//  Created by fg on 15/3/24.

#import "HcCustomKeyboard.h"
#import <UIKit/UIKit.h>

//屏幕宽度
#define WIDTH_SCREEN [UIScreen mainScreen].applicationFrame.size.width
//屏幕高度
#define HEIGHT_SCREEN [UIScreen mainScreen].applicationFrame.size.height


@implementation HcCustomKeyboard
@synthesize mDelegate;

static HcCustomKeyboard *customKeyboard = nil;

+(HcCustomKeyboard *)customKeyboard
{
    @synchronized(self)
    {
        if (customKeyboard == nil)
        {
            customKeyboard = [[HcCustomKeyboard alloc] init];
        }
        return customKeyboard;
    }
}
+(id)allocWithZone:(struct _NSZone *)zone //确保使用者alloc时 返回的对象也是实例本身
{
    @synchronized(self)
    {
        if (customKeyboard == nil)
        {
            customKeyboard = [super allocWithZone:zone];
        }
        return customKeyboard;
    }
}
+(id)copyWithZone:(struct _NSZone *)zone //确保使用者copy时 返回的对象也是实例本身
{
    return customKeyboard;
}

-(void)textViewShowView:(UIViewController *)viewController customKeyboardDelegate:(id)delegate tableView:(UITableView *)aTableView
{
    
    isTouch = NO;
    
    _mViewController =viewController;
    _detailTableView = aTableView;
    self.mDelegate =delegate;
    _isTop = NO;//初始化NO
    
    _mBackView =[[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, WIDTH_SCREEN, 55)];
    _mBackView.backgroundColor =[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
    [_mViewController.view addSubview:_mBackView];
    
    _optionView = [[UIView alloc] initWithFrame:CGRectMake(0, _mBackView.frame.origin.y + _mBackView.bounds.size.height, WIDTH_SCREEN, 216)];
    [_optionView setBackgroundColor:[UIColor purpleColor]];
    [_mViewController.view addSubview:_optionView];
    
    _mSecondaryBackView =[[UIView alloc]initWithFrame:CGRectMake(_mBackView.bounds.size.width - 10 -45 -10 -230, 10, 230, 35)];
//    _mSecondaryBackView.backgroundColor =[UIColor colorWithRed:153/255.0 green:154/255.0 blue:158/255.0 alpha:1];
    [_mSecondaryBackView setBackgroundColor:[UIColor blueColor]];
    [_mSecondaryBackView.layer setCornerRadius:5.0f];
    [_mBackView addSubview:_mSecondaryBackView];
    
    _mTextView =[[UITextView alloc]initWithFrame:CGRectMake(1, 1, 228, 33)];
    _mTextView.backgroundColor =[UIColor whiteColor];
    [_mTextView setFont:[UIFont systemFontOfSize:15.0f]];
    _mTextView.delegate = self;
    _mTextView.contentInset    = UIEdgeInsetsMake(0,0,0,0);

    _mTextView.text = @"say something";
    _mTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [_mTextView.layer setCornerRadius:5.0f];
    [_mTextView setKeyboardType:UIKeyboardTypeDefault];
    [_mTextView setBackgroundColor:[UIColor redColor]];
    [_mSecondaryBackView addSubview:_mTextView];
    
//    UIImageView *talkImg =[[UIImageView alloc]initWithFrame:CGRectMake(250, 16, 18, 18)];
//    talkImg.image =[UIImage imageNamed:@"icon_0040_Shape-36.png"];
//    [_mBackView addSubview:talkImg];
    
    _mTalkBtn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_mTalkBtn setTitle:@"send" forState:UIControlStateNormal];
    [_mTalkBtn addTarget:self action:@selector(forTalk) forControlEvents:UIControlEventTouchUpInside];
    _mTalkBtn.frame =CGRectMake(_mBackView.bounds.size.width - 45-10, 10, 45, 35);
    _mTalkBtn.layer.borderWidth = 1.0f;
    [[_mTalkBtn layer] setCornerRadius:5.0f];
//    [_mTalkBtn setTintColor:[UIColor blackColor]];
    [_mBackView addSubview:_mTalkBtn];
    
    _mPlusBtn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_mPlusBtn setTitle:@"+" forState:UIControlStateNormal];
    [_mPlusBtn addTarget:self action:@selector(forOption) forControlEvents:UIControlEventTouchUpInside];
    _mPlusBtn.frame =CGRectMake(_mBackView.bounds.size.width - 10 - 45 - 10 - 230 - 10 - 45, 10, 45, 35);
    _mPlusBtn.layer.borderWidth = 1.0f;
    [[_mPlusBtn layer] setCornerRadius:5.0f];
    [_mBackView addSubview:_mPlusBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChanged:) name:UITextViewTextDidChangeNotification object:nil];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_mTextView resignFirstResponder];
    return YES;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    _mTextView.text = nil;
    return YES;
}

-(void)forTalk //评论按钮
{
    
    if (_isTop ==NO)
    {
        [_mTextView becomeFirstResponder];
    }
    else
    {
        [mDelegate talkBtnClick:_mTextView];
        
        if (_mTextView.text.length==0)
        {
            NSLog(@"text null");
        }
        else
        {
            [_mTextView resignFirstResponder];
            if(_isTop){
                [_mHiddeView removeFromSuperview];
                _mHiddeView =nil;
                _mBackView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, WIDTH_SCREEN, 50);
                _optionView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, WIDTH_SCREEN, 216);
                [_detailTableView setTransform:CGAffineTransformIdentity];
                _mTextView.text = @"say something";
            }
        }
    }
    
}

-(void) forOption{
    isTouch = YES;
    if (_mHiddeView && _isTop && _keyboardRect.size.height > _optionView.bounds.size.height){
        CGFloat moveY = _keyboardRect.size.height - _optionView.bounds.size.height;
        CGRect backViewFrame = _mBackView.frame;
        CGRect optionViewFrame = _optionView.frame;
                
        backViewFrame.origin.y += moveY;
        optionViewFrame.origin.y += moveY;
                
        _mBackView.frame = backViewFrame;
        _optionView.frame = optionViewFrame;
                
        [_detailTableView setTransform:CGAffineTransformMakeTranslation(0, -_keyboardRect.size.height+moveY)];

    }
    else{
        _mBackView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-216-50, WIDTH_SCREEN, 50);
        _optionView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-216, WIDTH_SCREEN, 216);
    }
    [_mTextView resignFirstResponder];
    isTouch = NO;

}
-(void)hideView //點擊畫面 鍵盤消失
{
    NSLog(@"畫面消失");
    [_mHiddeView removeFromSuperview];
    _mHiddeView =nil;
    _mBackView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, WIDTH_SCREEN, 50);
    _optionView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, WIDTH_SCREEN, 216);
    [_detailTableView setTransform:CGAffineTransformIdentity];
    [_mTextView resignFirstResponder];
}

- (void)keyboardWillShow:(NSNotification*)notification
{
    CGSize contentSize = _mTextView.contentSize;
    
    NSLog(@"contentSize_h1111 = %f, textview_high1111 = %f",contentSize.height,_mTextView.frame.size.height);
    _isTop =YES;
    _keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (!_mHiddeView) //如果鍵盤出現
    {
        _mHiddeView =[[UIView alloc]initWithFrame:CGRectMake(0, 0,WIDTH_SCREEN,HEIGHT_SCREEN)];
        _mHiddeView.backgroundColor =[UIColor blackColor];
        _mHiddeView.alpha =0.0f;
        [_mViewController.view addSubview:_mHiddeView];
        
        UIButton *hideBtn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        hideBtn.backgroundColor =[UIColor clearColor];
        hideBtn.frame = _mHiddeView.frame;
        [hideBtn addTarget:self action:@selector(hideView) forControlEvents:UIControlEventTouchUpInside];
        [_mHiddeView addSubview:hideBtn];
        
        [_detailTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:29 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        
        [UIView animateWithDuration:0.3 animations:^{
            _mHiddeView.alpha =0.4f;
            _mBackView.frame =CGRectMake(0, HEIGHT_SCREEN-_keyboardRect.size.height-30, WIDTH_SCREEN, 55);
            _optionView.frame = CGRectMake(0, HEIGHT_SCREEN-_keyboardRect.size.height+20, WIDTH_SCREEN, 216);
            [_mViewController.view bringSubviewToFront:_mBackView];
            [_mViewController.view bringSubviewToFront:_optionView];

            [_detailTableView setTransform:CGAffineTransformMakeTranslation(0, -_keyboardRect.size.height)];
        } completion:^(BOOL finished) {
        }];
    }
    else{ //判斷切換鍵盤
        CGRect keyBoardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGRect selfFrame = _mBackView.frame;
        CGRect optionViewFrame = _optionView.frame;
        
        if(selfFrame.origin.y + selfFrame.size.height > keyBoardRect.origin.y){//判斷如果textview如果被鍵盤遮住 上移
            CGFloat movY = (selfFrame.origin.y + selfFrame.size.height)-keyBoardRect.origin.y;
            selfFrame.origin.y -= movY;
            _mBackView.frame = selfFrame;
            
            optionViewFrame.origin.y = _mBackView.frame.origin.y +_mBackView.frame.size.height;
            _optionView.frame = optionViewFrame;

            
        }
        else{ //沒有被鍵盤遮住
            selfFrame.origin.y =keyBoardRect.origin.y - selfFrame.size.height;
            _mBackView.frame = selfFrame;
            [_detailTableView setTransform:CGAffineTransformMakeTranslation(0, -_keyboardRect.size.height)];
            
            optionViewFrame.origin.y = _mBackView.frame.origin.y +_mBackView.frame.size.height;
            _optionView.frame = optionViewFrame;
        }

    }
    

}
- (void)keyboardWillHide:(NSNotification*)notification
{    
    if(!isTouch){
        _isTop =NO;
        [UIView animateWithDuration:0.3 animations:^{
            _mBackView.frame=CGRectMake(0, HEIGHT_SCREEN-30, WIDTH_SCREEN, 55);
            _mHiddeView.alpha =0.0f;
            _mSecondaryBackView.frame =CGRectMake(_mBackView.bounds.size.width - 10 - 45 - 10 -230, 10, 230,35);
            _optionView.frame = CGRectMake(0, _mBackView.frame.origin.y + _mBackView.frame.size.height, WIDTH_SCREEN, 216);
            CGRect i = _mTalkBtn.frame;
        //        i.origin.y = _mTextView.frame.size.height - i.size.height -7 + i.size.height;
        //        i.origin.y = i.origin.y + _mTextView.frame.size.height - i.size.height +2;
        
            i.origin.y = _mSecondaryBackView.frame.origin.y + _mSecondaryBackView.frame.size.height - i.size.height;
        
            _mTalkBtn.frame = i;
            _mTextView.text =@"say so something";
            [_detailTableView setTransform:CGAffineTransformIdentity];
            
        } completion:^(BOOL finished) {
            [_mHiddeView removeFromSuperview];
            _mHiddeView =nil;
            //键盘消失时，恢复TextView内容
        }];
    }

}
- (void)textDidChanged:(NSNotification *)notif
{
    CGSize contentSize = _mTextView.contentSize;
//    CGSize contentSize = [_mTextView.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}];
//    int line = (contentSize.width-15) / _mTextView.frame.size.width + 1;
//    contentSize.height = line * 29;
    
    NSLog(@"contentSize_h = %f, textview_high = %f",_mSecondaryBackView.frame.size.height, _mTextView.frame.size.height);
    
    if (contentSize.height > 90){
        return;
    }
        
    CGRect selfFrame = _mBackView.frame;
    CGFloat selfHeight = _mTextView.superview.frame.origin.y * 2 + contentSize.height +1;
    CGFloat selfOriginY = selfFrame.origin.y - (selfHeight - selfFrame.size.height);
    selfFrame.origin.y = selfOriginY;
    selfFrame.size.height = selfHeight;
    _mBackView.frame = selfFrame;
    _mSecondaryBackView.frame =CGRectMake(_mBackView.bounds.size.width - 10 - 45 - 10 - 230, 10, 230, selfHeight-20);
    _mTalkBtn.frame =CGRectMake(_mBackView.bounds.size.width - 45 - 10, 10, 45, 35);
    
    NSLog(@"----contentSize_h = %f, textview_high = %f",_mSecondaryBackView.frame.size.height, _mTextView.frame.size.height);
    CGRect i = _mTalkBtn.frame;
//    i.origin.y = i.origin.y + _mTextView.frame.size.height - i.size.height +2;
    i.origin.y = _mSecondaryBackView.frame.origin.y + _mSecondaryBackView.frame.size.height - i.size.height;
    
    _mTalkBtn.frame = i;
    
    if(_mTextView.text.length > 0 ) {
        NSRange bottom = NSMakeRange(_mTextView.text.length -1, 1);
        [_mTextView scrollRangeToVisible:bottom];
    }

    NSLog(@"text change");
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
//    if ([text isEqualToString:@"\n"]) {
//        textView.contentOffset = CGPointMake(0.0, textView.contentSize.height);
//    }
    return YES;
}

-(void)dealloc //移除通知
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}


@end


