//
//  ArticleTableViewCell.m
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "ArticleTableViewCell.h"

@implementation ArticleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    _articleImageView.contentMode = UIViewContentModeScaleAspectFit;
}

// Makes separator run through length of screen in iOS 8.
- (UIEdgeInsets)layoutMargins
{
    return UIEdgeInsetsZero;
}


@end
