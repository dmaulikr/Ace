//
//  6View.m
//  TestArrangements
//
//  Created by Odie Edo-Osagie on 13/12/2015.
//  Copyright © 2015 Odie Edo-Osagie. All rights reserved.
//

#import "SixView.h"

@implementation SixView

- (id) init
{
    self = [super init];
    
    if(self){
        _imageSize = 50;
        [self setupImageViews];
    }
    
    return self;
}

- (void) setupImageViews
{
    _centreImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _imageSize, _imageSize)];
    _centreImageView.center = self.center;
    _centreImageView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    _centreImageView.image = [UIImage imageNamed:@"sixfeet.jpg"];
    [self addSubview:_centreImageView];
    
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _centreImageView.frame.origin.y, _imageSize, _imageSize)];
    _leftImageView.center = CGPointMake(self.center.x-100, self.center.y);
    _leftImageView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    //_leftImageView.image = [UIImage imageNamed:@"sixfeet.jpg"];
    [self addSubview:_leftImageView];
    
    _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _centreImageView.frame.origin.y, _imageSize, _imageSize)];
    _rightImageView.center = CGPointMake(self.center.x+100, self.center.y);
    _rightImageView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    [self addSubview:_rightImageView];
    
    _topLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _centreImageView.frame.origin.y, _imageSize, _imageSize)];
    _topLeftImageView.center = CGPointMake(self.center.x-50, self.center.y-100);
    _topLeftImageView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    [self addSubview:_topLeftImageView];
    
    _topRightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _centreImageView.frame.origin.y, _imageSize, _imageSize)];
    _topRightImageView.center = CGPointMake(self.center.x+50, self.center.y-100);
    _topRightImageView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    [self addSubview:_topRightImageView];
    
    _bottomLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _centreImageView.frame.origin.y, _imageSize, _imageSize)];
    _bottomLeftImageView.center = CGPointMake(self.center.x-50, self.center.y+100);
    _bottomLeftImageView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    [self addSubview:_bottomLeftImageView];
    
    _bottomRightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _centreImageView.frame.origin.y, _imageSize, _imageSize)];
    _bottomRightImageView.center = CGPointMake(self.center.x+50, self.center.y+100);
    _bottomRightImageView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
    [self addSubview:_bottomRightImageView];
}

@end
