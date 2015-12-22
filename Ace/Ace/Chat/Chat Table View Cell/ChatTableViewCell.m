//
//  ChatTableViewCell.m
//  Ace
//
//  Created by Takomborerwa Mazarura on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "ChatTableViewCell.h"

extern NSString * const kChatTableViewCellID;
extern NSString * const kChatTableViewCellNibName;

NSString * const kChatTableViewCellID = @"ChatTableViewCellID";
NSString * const kChatTableViewCellNibName = @"ChatTableViewCell";

@implementation ChatTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (!self) return nil;
    
    [self initializeSubviews];
    
    return self;
}

#pragma mark - View Configuration (private)

- (void)initializeSubviews
{
    
    self.backgroundColor = kIMPWhite;
    
    [self setupBrandImageView];
    
    [self setupBrandNameCell];
    
}

- (void)setupBrandImageView
{
    
    self.userImageView = UIImageView.new;
    self.userImageView.image = [UIImage imageNamed:@"user-50"];
    self.userImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.userImageView.contentMode = UIViewContentModeCenter;
    self.userImageView.layer.cornerRadius = 60 / 2;
    self.userImageView.layer.borderWidth = 2.0f;
    self.userImageView.backgroundColor = kIMPMediumLightGray;
    self.userImageView.layer.borderColor = kIMPWhite.CGColor;
    self.userImageView.layer.masksToBounds = YES;
    [self addSubview:self.userImageView];
    
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.width.equalTo(@(60));
        make.height.equalTo(@(60));
        make.centerY.equalTo(self.mas_centerY);
    }];
    
}

- (void)setupBrandNameCell
{
    self.userNameLabel = UILabel.new;
    self.userNameLabel.textColor = kIMPDarkGrey;
    self.userNameLabel.enabled = YES;
    self.userNameLabel.text = @"Store Name";
    self.userNameLabel.font = font(kBariolRegular, 16);
    self.userNameLabel.textAlignment = NSTextAlignmentCenter;
    self.userNameLabel.numberOfLines = 3;
    self.userNameLabel.clipsToBounds = YES;
    self.userNameLabel.backgroundColor = [UIColor clearColor];
    [self.userNameLabel sizeToFit];
    [self.userNameLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [self addSubview:self.userNameLabel];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.userImageView.mas_centerY);
        make.left.equalTo(self.userImageView.mas_right).offset(10);;
    }];
    
}

#pragma mark - Configure View (Public)

- (void)configureWithUser:(PFUser*)user
{
    
    if (user[@"profilePic"]) {
        
        PFFile *retailerProfilePicture = user[@"profilePic"];
        
        [self configureWithImageFile:retailerProfilePicture];
        
    }else{
        
        [self configureForNilImage];
        
    }
    
    if (user.username) {
        
        self.userNameLabel.text = user.username;
        
    }
    
}

- (void)configureForDefault
{
    
    self.userImageView.image = [UIImage imageNamed:@"Product-50-active"];
    
    self.userNameLabel.text = @"";
    
}

- (void)configureWithImageFile:(PFFile*)imageFile
{
    
    if (imageFile != nil) {
        
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            
            if(!error){
                
                UIImage *image = [UIImage imageWithData:data];
                
                self.userImageView.image = image;
                
                self.userImageView.contentMode = UIViewContentModeScaleAspectFill;
                
                self.userImageView.clipsToBounds = YES;
                
            }else{
                
                [self configureForNilImage];
                
            }
        }];
        
    }else{
        
        [self configureForNilImage];
        
    }
}

- (void)configureForNilImage
{
    
    UIImage *image = [UIImage imageNamed:@"Product_Placeholder_50"];
    
    self.userImageView.image = image;
    
    self.userImageView.clipsToBounds = YES;
    
    self.userImageView.contentMode = UIViewContentModeCenter;
    
}

@end
