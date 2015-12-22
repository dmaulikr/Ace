//
//  SwipeViewUserCollectionViewCell.h
//  Ace
//
//  Created by Takomborerwa Mazarura on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kSwipeViewUserCollectionViewCellID;
extern NSString * const kSwipeViewUserCollectionViewCellNibName;

@interface SwipeViewUserCollectionViewCell : UICollectionViewCell
{
    CGFloat height;
    
    CGFloat width;
    
    CGFloat buttonHeight;
    
}

#pragma mark - Configure View (Private)

@property (nonatomic, strong, readwrite) UIImage *userImage;

@property (nonatomic, strong, readwrite) UIImageView *userImageView;

@property (nonatomic, strong, readwrite) UIImageView *userNewImageView;

@property (nonatomic, strong, readwrite) UIView *addUserContainer;

@property (strong, nonatomic) PFObject *user;

@property (assign, nonatomic) int cellIndex;

#pragma mark - Configure View (Public)

- (void)configureWithUser:(PFFile*)imageFile;

- (void)configureWithImageFile:(PFFile*)imageFile;

- (void)configureWithUserImage:(UIImage*)image;

- (void)confureForIndex:(int)index;

- (void)configureForNilImage;

@end
