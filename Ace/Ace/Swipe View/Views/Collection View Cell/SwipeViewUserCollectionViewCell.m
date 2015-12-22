//
//  SwipeViewUserCollectionViewCell.m
//  Ace
//
//  Created by Takomborerwa Mazarura on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "SwipeViewUserCollectionViewCell.h"

NSString * const kSwipeViewUserCollectionViewCellID       = @"SwipeViewUserCollectionViewCellID";
NSString * const kSwipeViewUserCollectionViewCellNibName  = @"SwipeViewUserCollectionViewCell";

@implementation SwipeViewUserCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
        
        [self initializeSubviews];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self)
        
        [self initializeSubviews];
    
    return self;
}

#pragma mark - View Configuration (private)

- (void)initializeSubviews
{
    
    [self setupUserImageView];
    
}

- (void)setupUserImageView
{
    height = self.frame.size.width / 4 * 3.15;
    
    self.userImageView = UIImageView.new;
    
    self.userImageView.image = [UIImage imageNamed:@"prince"];
    
    self.userImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.userImageView.clipsToBounds = YES;
    
    self.userImageView.layer.cornerRadius = height/2;
    
    self.userImageView.layer.borderWidth  = 0.0f;
    
    self.userImageView.layer.masksToBounds = YES;
    
    [self addSubview:self.userImageView];
    
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@(height));
        make.height.equalTo(@(height));
    }];
    
}

#pragma mark - Setup Method

- (void)setupAddUserContainer
{
    
    height = self.frame.size.width / 4 * 3.5;
    
    self.addUserContainer = UIImageView.new;
    
    self.addUserContainer.backgroundColor = kIMPRed;
    
    self.addUserContainer.contentMode = UIViewContentModeScaleAspectFit;
    
    self.addUserContainer.clipsToBounds = YES;
    
    self.addUserContainer.layer.borderColor = kIMPWhite.CGColor;
    
    [self addSubview:self.addUserContainer];
    
    [self.addUserContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@(height));
        make.height.equalTo(@(height));
    }];
    
}

#pragma mark - Configure View (Public)

- (void)configureForWithuser:(NSDictionary*)product
{
    
}

- (void)configureWithImageFile:(PFFile*)imageFile
{
    
    if (imageFile != nil) {
        
        [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            
            if(!error){
                
                self.userImageView.hidden = YES;
                
                UIImage *image = [UIImage imageWithData:data];
                
                self.userNewImageView.image = image;
                
            }else{
                
                //[self configureForNilImage];
                
            }
        }];
        
    }else{
        
        //[self configureForNilImage];
        
    }
}

- (void)configureWithUserImage:(UIImage*)image
{
    
    self.userImage = image;
    
    self.userNewImageView.image = image;
    
    self.userNewImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.userNewImageView = UIImageView.new;
    
    self.userNewImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.userNewImageView.clipsToBounds = YES;
    
    self.userNewImageView.layer.cornerRadius = height/2;
    
    self.userNewImageView.layer.borderWidth  = 0.0f;
    
    self.userNewImageView.layer.masksToBounds = YES;
}

- (void)configureForNilImage
{
    
    UIImage *image = [UIImage imageNamed:@"fiona"];
    
    self.userNewImageView.image = image;
    
    self.userNewImageView = UIImageView.new;
    
    self.userNewImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.userNewImageView.clipsToBounds = YES;
    
    self.userNewImageView.layer.cornerRadius = height/2;
    
    self.userNewImageView.layer.borderWidth  = 0.0f;
    
    self.userNewImageView.layer.masksToBounds = YES;
    
}

- (void)confureForIndex:(int)index
{
    
    int offset = 50;
    
    switch (index) {
            
        case 0:
            
            [self hideIntrestImageView];
            
            [self configureWithPositiveOffset:offset yOffset:0];
            
            break;
            
        case 1:
            
            [self hideIntrestImageView];
            
            break;
            
        case 2:
            
            [self hideIntrestImageView];
            
            [self configureWithNegativeOffset:-offset yOffset:0];
            
            break;
            
        case 3:
            
            [self hideIntrestImageView];
            
            [self configureWithPositiveOffset:15 yOffset:0];
            
            break;
            
        case 4:
            
            [self hideIntrestImageView];
            
            [self configureWithPositiveOffset:0 yOffset:0];
            
            break;
            
        case 5:
            
            [self hideIntrestImageView];
            
            [self configureWithNegativeOffset:-15 yOffset:0];
            
            break;
            
        case 6:
            
            [self hideIntrestImageView];
            
            [self configureWithPositiveOffset:offset yOffset:0];
            
            break;
            
        case 7:
            
            [self hideIntrestImageView];
            
            break;
            
        case 8:
            
            [self hideIntrestImageView];
            
            [self configureWithNegativeOffset:-offset yOffset:0];
            
            break;
            
        default:
            break;
    }
    
    
}

- (void)configureWithPositiveOffset:(int)xOffset yOffset:(int)yOffset
{
    self.userImageView.hidden = YES;
    
    UIView *superview = self.contentView;
    
    height = self.frame.size.width / 4 * 3.15;
    
    self.userNewImageView = UIImageView.new;
    
    self.userNewImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.userNewImageView.clipsToBounds = YES;
    
    self.userNewImageView.layer.cornerRadius = height/2;
    
    self.userNewImageView.layer.borderWidth  = 0.0f;
    
    self.userNewImageView.layer.masksToBounds = YES;
    
    [self addSubview:self.userNewImageView];
    
    [self.userNewImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(xOffset);
        make.centerY.equalTo(self.mas_centerY).offset(yOffset);
        make.width.equalTo(@(height));
        make.height.equalTo(@(height));
    }];
}

- (void)configureWithNegativeOffset:(int)xOffset yOffset:(int)yOffset
{
    self.userImageView.hidden = YES;
    
    UIView *superview = self.contentView;
    
    height = self.frame.size.width / 4 * 3.15;
    
    self.userNewImageView = UIImageView.new;
    
    self.userNewImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.userNewImageView.clipsToBounds = YES;
    
    self.userNewImageView.layer.cornerRadius = height/2;
    
    self.userNewImageView.layer.borderWidth  = 0.0f;
    
    self.userNewImageView.layer.masksToBounds = YES;
    
    [self addSubview:self.userNewImageView];
    
    [self.userNewImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX).offset(xOffset);
        make.centerY.equalTo(self.mas_centerY).offset(yOffset);
        make.width.equalTo(@(height));
        make.height.equalTo(@(height));
    }];
}

- (void)hideIntrestImageView
{
    self.userImageView.hidden = YES;
    
}

@end
