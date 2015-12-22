//
//  NewsFeedCollectionViewCell.m
//  Ace
//
//  Created by Takomborerwa Mazarura on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "NewsFeedCollectionViewCell.h"

@interface NewsFeedCollectionViewCell()

@end

@implementation NewsFeedCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) [self configureStandardView];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) [self configureStandardView];
    
    return self;
}

#pragma mark - Setup Method

- (void)configureStandardView
{
    self.backgroundColor = [UIColor whiteColor];
    
    [self setupImageView];
    
    [self setupGradient];
    
    [self setupLabels];
    
}

- (void)setupGradient
{
    int height = 100;
    
    UIView *superview = self;
    
    UIView *gradientView = UIView.new;
    
    [superview addSubview:gradientView];
    
    [gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).offset(-height);
        make.width.equalTo(@(self.frame.size.width));
    }];

    self.fadeView = gradientView;
    
    UIColor *black = [UIColor blackColor];
    NSArray *colors = @[(id)[[black colorWithAlphaComponent:0.9] CGColor],
                        (id)[[black colorWithAlphaComponent:0.8] CGColor],
                        (id)[[black colorWithAlphaComponent:0.7] CGColor],
                        (id)[[black colorWithAlphaComponent:0.6] CGColor],
                        (id)[[black colorWithAlphaComponent:0.4] CGColor],
                        (id)[[black colorWithAlphaComponent:0.2] CGColor],
                        (id)[[black colorWithAlphaComponent:0.1] CGColor],
                        (id)[[black colorWithAlphaComponent:0.0] CGColor]];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.colors = colors;
    
    CGPoint top = CGPointMake(0.0f, 1.0f);
    CGPoint bottom = CGPointMake(0.0f, 0.0f);
    
    gradientLayer.startPoint = top;
    gradientLayer.endPoint = bottom;
    
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, height);
    
    [gradientView.layer insertSublayer:gradientLayer
                               atIndex:0];
}

- (void)setupLabels
{
    
    self.storyHeadline = UILabel.new;
    self.storyHeadline.layer.masksToBounds = YES;
    self.storyHeadline.text = @"HEADLINE";
    self.storyHeadline.textColor = [UIColor whiteColor];
    self.storyHeadline.textAlignment = NSTextAlignmentCenter;
    self.storyHeadline.font = font(kBariolRegular, 14);
    [self.storyHeadline setFont:[UIFont systemFontOfSize:14]];
    self.storyHeadline.numberOfLines = 2;
    self.storyHeadline.lineBreakMode = NSLineBreakByWordWrapping;
    self.storyHeadline.backgroundColor = [UIColor clearColor];
    [self.storyHeadline sizeToFit ];
    [self addSubview:self.storyHeadline];
    
    [self.storyHeadline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
        make.width.equalTo(@(self.frame.size.width /3 *2));
    }];
    
}

- (void)setupImageView
{
    self.clipsToBounds = YES;
    
    CGRect frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 400, IMAGE_HEIGHT);
    
    self.JiggyImageView = [[UIImageView alloc] initWithFrame:frame];
    
    self.JiggyImageView.backgroundColor = [UIColor whiteColor];
    
    self.JiggyImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.JiggyImageView.clipsToBounds = NO;
    
    [self.contentView addSubview:self.JiggyImageView];
    
}

# pragma mark - Setters

- (void)setImage:(UIImage *)image
{
    
    self.JiggyImageView.image = image;
    
    [self setImageOffset:self.imageOffset];
    
}

- (void)setImageOffset:(CGPoint)imageOffset
{

    _imageOffset = imageOffset;
    
    CGRect frame = self.JiggyImageView.bounds;
    
    CGRect offsetFrame = CGRectOffset(frame, _imageOffset.x, _imageOffset.y);
    
    self.JiggyImageView.frame = offsetFrame;

}

- (void)setupImageOffset
{
     [self setImageOffset:self.imageOffset];
}

@end
