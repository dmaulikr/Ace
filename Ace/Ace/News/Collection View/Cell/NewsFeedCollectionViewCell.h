//
//  NewsFeedCollectionViewCell.h
//  Ace
//
//  Created by Takomborerwa Mazarura on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMAGE_HEIGHT 320
#define IMAGE_OFFSET_SPEED 30


@interface NewsFeedCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, readwrite) UIImage *image;

@property (nonatomic, assign, readwrite) CGPoint imageOffset;

@property (nonatomic, assign) CGFloat frameWidth;

@property (strong, nonatomic) UIView *fadeView;

@property (strong, nonatomic) UILabel *storyHeadline;

@property (strong, nonatomic) UILabel *storyMiniDescription;

@property (nonatomic, strong, readwrite) UIImageView *JiggyImageView;

- (void)setupImageOffset;

@end
