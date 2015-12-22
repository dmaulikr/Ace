//
//  ChatTableViewCell.h
//  Ace
//
//  Created by Takomborerwa Mazarura on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kChatTableViewCellID;
extern NSString * const kChatTableViewCellNibName;

@interface ChatTableViewCell : UITableViewCell

#pragma mark - Configure View (Private)

@property (strong, nonatomic) UIImageView *userImageView;

@property (strong, nonatomic) UILabel *userNameLabel;

#pragma mark - Configure View (Public)

- (void)configureWithUser:(PFUser*)user;

- (void)configureForDefault;

@end
