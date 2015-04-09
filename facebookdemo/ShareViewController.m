//
//  ShareViewController.m
//  facebookdemo
//
//  Created by fg on 2015/3/12.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        isEditting = YES;
        isNickNamePost = NO;
        isOpen = NO;
        nickName = @"";
        selectIndex = 0;
        shareArray = [[NSArray alloc] initWithObjects:@"Facebook",@"Twitter",@"Tumbir",@"Flickr",@"新浪微博",@"Google+", nil];
        nickArray = [[NSArray alloc] initWithObjects:@"是否匿名發言",@"自訂暱稱", nil];
        editArray = [[NSArray alloc] initWithObjects:@"文章是否編輯完", nil];
        totalArray =[[NSMutableArray alloc] initWithObjects:shareArray,nickArray,editArray, nil];
        doShareArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"分享對象"];
    
    UIButton *liftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [liftButton setTitle:@"Back" forState:UIControlStateNormal];
    [liftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [liftButton addTarget:self action:@selector(doLiftButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *liftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:liftButton];
    [self.navigationItem setLeftBarButtonItem:liftBarButtonItem];
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightButton setTitle:@"Post" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(doRightButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.bounds.size.width, 25)];
    
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - doNavigationButton

- (void) doLiftButton:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) doRightButton:(id)sender{
    
}

#pragma mark - UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [totalArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(section == 0){
        return [[totalArray objectAtIndex:section] count] / 2;
    }
    else if(section == 1){
        if(isOpen){
            return [[totalArray objectAtIndex:section] count];
        }
        else{
            return [[totalArray objectAtIndex:section] count] - 1;
        }
    }
    else{
        return [[totalArray objectAtIndex:section] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if(indexPath.section == 0){
        int width = self.view.frame.size.width / 2;
        for(int x = 0 ; x < 2 ; x++){
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((width*x)+ 1*(x+1), (cell.frame.size.height - 30)/2, width-1, 30)];
            [button setTag: x + indexPath.row * 2];
            int tag =  x + ((int)indexPath.row * 2);
            [button setTitle:[NSString stringWithFormat:@"%@", [shareArray objectAtIndex:tag]]forState:UIControlStateNormal];
            [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            [[button layer] setBorderWidth:1.0f];
            [[button layer] setBorderColor:[UIColor purpleColor].CGColor];
            [[button layer] setCornerRadius:8];
            
            [button addTarget:self action:@selector(doShareButton:) forControlEvents:UIControlEventTouchUpInside];

            [cell.contentView addSubview:button];
        }
    }
    
    if(indexPath.section == 1){
        if(indexPath.row == 1){
            nicktextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 10, self.view.frame.size.width-30, 30)];
            [nicktextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
            [nicktextField setReturnKeyType:UIReturnKeyDone];
            [nicktextField setPlaceholder:[[totalArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
            
            [nicktextField setDelegate:self];
            [nicktextField addTarget:self action:@selector(textFieldWithText:) forControlEvents:UIControlEventEditingChanged];
            
            [cell setAccessoryView:nicktextField];
        }
        else{
            [cell.textLabel setText:[[totalArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
            UISwitch *selectSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            [selectSwitch setOn:NO];
            
            [selectSwitch addTarget:self action:@selector(onSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
            
            [cell setAccessoryView:selectSwitch];
        }
    }
    
    if(indexPath.section == 2){
        [cell.textLabel setText:[[totalArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
        UISwitch *selectSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        [selectSwitch setOn:isEditting];
        [selectSwitch addTarget:self action:@selector(onSwitchValueChanged:) forControlEvents:UIControlEventValueChanged];
        [cell setAccessoryView:selectSwitch];
    }
    return cell;
}

//-(UITableViewCell*)GetCellFromTableView:(UITableView*)tableView Sender:(id)sender {
//    CGPoint pos = [sender convertPoint:CGPointZero toView:tableView];
//    NSIndexPath *indexPath = [tableView indexPathForRowAtPoint:pos];
//    return [tableView cellForRowAtIndexPath:indexPath];
//}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    switch (section) {
//        case 0:
//            return @" ";
//            break;
//
//        case 1:
//            return @" ";
//            break;
//
//        default:
//            return @" ";
//            break;
//    }
//}


#pragma mark - 鍵盤按return就縮下

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - shareButton

-(void)doShareButton:(UIButton *)sender{
    selectIndex = (int)sender.tag;
    NSNumber *number = [NSNumber numberWithLong:selectIndex];
    
    
    if([doShareArray containsObject:number]){
        NSLog(@"刪除 %@",number);

        [doShareArray removeObject:number];
        if (selectIndex == 0) {
            [sender setTitle:[NSString stringWithFormat:@"%@",[shareArray objectAtIndex:selectIndex]] forState:UIControlStateNormal];
        }
        else if (selectIndex == 1){
            [sender setTitle:[NSString stringWithFormat:@"%@",[shareArray objectAtIndex:selectIndex]] forState:UIControlStateNormal];
        }
        else if (selectIndex == 2){
            [sender setTitle:[NSString stringWithFormat:@"%@",[shareArray objectAtIndex:selectIndex]] forState:UIControlStateNormal];
        }
        else if (selectIndex == 3){
            [sender setTitle:[NSString stringWithFormat:@"%@",[shareArray objectAtIndex:selectIndex]] forState:UIControlStateNormal];
        }
        else if (selectIndex == 4){
            [sender setTitle:[NSString stringWithFormat:@"%@",[shareArray objectAtIndex:selectIndex]] forState:UIControlStateNormal];
        }
        else{
            [sender setTitle:[NSString stringWithFormat:@"%@",[shareArray objectAtIndex:selectIndex]] forState:UIControlStateNormal];
        }
        NSLog(@"刪除後的 %@",doShareArray);
    }
    else{
        NSLog(@"新增%@",number);
        [doShareArray addObject:number];
        if (selectIndex == 0) {
            [sender setTitle:@"facebook已被選取" forState:UIControlStateNormal];
            //判斷有沒有token,沒有的話,跟使用者要
        }
        else if (selectIndex == 1){
            [sender setTitle:@"1已被選取" forState:UIControlStateNormal];
        }
        else if (selectIndex == 2){
            [sender setTitle:@"2已被選取" forState:UIControlStateNormal];
        }
        else if (selectIndex == 3){
            [sender setTitle:@"3已被選取" forState:UIControlStateNormal];
        }
        else if (selectIndex == 4){
            [sender setTitle:@"4已被選取" forState:UIControlStateNormal];
        }
        else{
            [sender setTitle:@"5已被選取" forState:UIControlStateNormal];
        }
        
        NSLog(@"新增後的 %@",doShareArray);

    }
    
}

#pragma mark - 紀錄文字

- (void)textFieldWithText:(UITextField *)textField{
    if(isOpen){
        text = textField.text;
        NSLog(@"text:%@",text);
    }
}


#pragma mark - 開關判斷

-(void)onSwitchValueChanged:(id)sender
{
    UISwitch *tmp = sender;
    
    NSIndexPath *index = [_tableView indexPathForCell:(UITableViewCell *)[sender superview]];

    UITableViewCell *tmpcell = (UITableViewCell *)tmp.superview;

    NSString *layerName = [[tmpcell textLabel] text];

    if([layerName isEqualToString:@"是否匿名發言"]){
        if(tmp.isOn){
            isOpen = YES;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index.row+1 inSection:index.section];
            NSLog(@"indePath = %@",indexPath);
            [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        }
        else{
            isOpen = NO;
            [nicktextField setText:@""];
            text = @"";
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index.row+1 inSection:index.section];
            [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        }
    }
    else{
        isEditting = tmp.isOn;
        NSLog(@"Editting = %d",isEditting);
    }
}


@end
