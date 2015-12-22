//
//  6View.h
//  TestArrangements
//
//  Created by Odie Edo-Osagie on 13/12/2015.
//  Copyright © 2015 Odie Edo-Osagie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SixView : UIView

@property (nonatomic, strong) UIImageView *centreImageView;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UIImageView *topLeftImageView;
@property (nonatomic, strong) UIImageView *bottomLeftImageView;
@property (nonatomic, strong) UIImageView *topRightImageView;
@property (nonatomic, strong) UIImageView *bottomRightImageView;

@property (nonatomic, assign) int imageSize;

@end
