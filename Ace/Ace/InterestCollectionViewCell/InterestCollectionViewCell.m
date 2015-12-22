//
//  InterestCollectionViewCell.m
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "InterestCollectionViewCell.h"

@implementation InterestCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setup];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [_imageView setFrame:self.bounds];
}


#pragma mark -  Helpers

- (void) setup
{    
    _imageView = [[UIImageView alloc] init];
    [_imageView setClipsToBounds:YES];
    [_imageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.contentView addSubview:_imageView];
}

@end
