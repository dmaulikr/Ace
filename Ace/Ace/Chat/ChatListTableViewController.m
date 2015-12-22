//
//  ChatListTableViewController.m
//  Ace
//
//  Created by Odie Edo-Osagie on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "ChatListTableViewController.h"
#import "UIImageView+WebCache.h"
#import "DemoMessagesViewController.h"
#import "ChatTableViewCell.h"

@interface ChatListTableViewController (){
    PFUser *user;
    UIBarButtonItem *refreshButton;
}

@end

@implementation ChatListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Chats";
    
    self.navigationController.navigationBar.barTintColor = kIMPYellow;
    
    [self setupNibs];
    
    /* Add right bar button */
    refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshButtonPressed)];
    self.navigationItem.rightBarButtonItem = refreshButton;
    
    _chats = [NSMutableArray new];
    user = [PFUser currentUser];
    [self fetchChats];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) fetchChats
{
    PFRelation *chatRelation = [user relationForKey:@"chats"];
    PFQuery *chatQueryA = [chatRelation query];
    PFQuery *chatQueryB = [chatRelation query];
    [chatQueryA whereKey:@"participantA" notEqualTo:[[PFUser currentUser] username]];
    [chatQueryA whereKey:@"participantB" notEqualTo:[[PFUser currentUser] username]];
    PFQuery *chatQuery = [PFQuery orQueryWithSubqueries:@[chatQueryA, chatQueryB]];
    [chatQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if(!error){
            _chats = [NSMutableArray arrayWithArray:objects];
            [self.tableView reloadData];
        }
    }];
}

- (void)setupNibs
{
    
    //[self.tableView registerNib:[UINib nibWithNibName:kChatTableViewCellNibName bundle:[NSBundle mainBundle]]
      //   forCellReuseIdentifier:kChatTableViewCellID];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_chats count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChatTableViewCell *cell = [[ChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kChatTableViewCellID];
    
    if (cell == nil) {
        
        cell = [[ChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kChatTableViewCellID];
        
    }

    PFObject *chat = _chats[indexPath.row];
    
    if([chat[@"participantA"] isEqualToString:[user username]]){
        
        cell.userNameLabel.text = chat[@"participantB"];
        
    }else{
        
        cell.userNameLabel.text = chat[@"participantA"];
        
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DemoMessagesViewController *d = [[DemoMessagesViewController alloc] init];
    [self.navigationController pushViewController:d animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
    
}

#pragma mark - Control Selectors

- (void) refreshButtonPressed
{
    [self fetchChats];
}

@end
