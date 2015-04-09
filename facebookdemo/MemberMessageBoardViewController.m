//
//  MemberMessageBoardViewController.m
//  facebookdemo
//
//  Created by fg on 2015/3/23.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "MemberMessageBoardViewController.h"
#import "MemberMessageBoardViewCellTableViewCell.h"
#import "MCMessageBoardDetailViewController.h"

@interface MemberMessageBoardViewController ()

@end

@implementation MemberMessageBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    userSearchBar = [[UISearchBar alloc] init];
    [userSearchBar setPlaceholder:@"用暱稱搜尋好友..."];
    [userSearchBar setBarTintColor:[UIColor redColor]];
    [userSearchBar setShowsCancelButton:YES];
    [userSearchBar sizeToFit];
    
    [userSearchBar setDelegate:self];
    
    [_userTableView setTableHeaderView:userSearchBar];
    [_userTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    UINib *nib = [UINib nibWithNibName:@"MemberMessageBoardViewCellTableViewCell" bundle:nil];
    [_userTableView registerNib:nib forCellReuseIdentifier:@"CellIdentifier"];
//    [_userTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    UIEdgeInsets edgeInset = _userTableView.separatorInset;
    _userTableView.separatorInset = UIEdgeInsetsMake(edgeInset.top, 10, edgeInset.bottom, 10);
    [_userTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MemberMessageBoardViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if(cell == nil){
        cell = [[MemberMessageBoardViewCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    [cell setMessageBoard];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MCMessageBoardDetailViewController *mCMessageBoardDetailViewController = [[MCMessageBoardDetailViewController alloc] initWithNibName:@"MCMessageBoardDetailViewController" bundle:nil index:(int)indexPath.row];
    [self.navigationController pushViewController:mCMessageBoardDetailViewController animated:YES];
}

#pragma mark UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if(searchText.length == 0 || [searchText isEqualToString:@""]){
        
    }
    else if(searchText.length == 1){
        [_userTableView reloadData];
    }
    else{
        [_userTableView reloadData];
    }
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [userSearchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [userSearchBar resignFirstResponder];
}

@end
