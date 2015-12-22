//
//  DesignUtils.m
//  ImpulseUpload
//
//  Created by Takomborerwa Mazarura on 16/05/2015.
//  Copyright (c) 2015 takomborerwa. All rights reserved.
//

#import "DesignUtils.h"

@implementation DesignUtils

+ (UIBarButtonItem *)backButtonItemWithTarget:(id)target action:(SEL)action
{
    // Create back button
    UIButton *backButton = UIButton.new;
    backButton.frame = CGRectMake(0, 0, 50, 50);
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -42, 0, 0);
    
    // Set image
    [backButton setImage:[UIImage imageNamed:@"icn-back"] forState:UIControlStateNormal];
    
    // Set target
    [backButton addTarget:target
                   action:action
         forControlEvents:UIControlEventTouchUpInside];
    
    // Create back bar button item
    UIBarButtonItem *backItem =
    [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    return backItem;
}


+ (UIBarButtonItem *)backButtonLightItemWithTarget:(id)target action:(SEL)action
{
    // Create back button
    UIButton *backButton = UIButton.new;
    backButton.frame = CGRectMake(0, 0, 50, 50);
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -42, 0, 0);
    
    // Set image
    [backButton setImage:[UIImage imageNamed:@"icn-back"] forState:UIControlStateNormal];
    
    // Set target
    [backButton addTarget:target
                   action:action
         forControlEvents:UIControlEventTouchUpInside];
    
    // Create back bar button item
    UIBarButtonItem *backItem =
    [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    return backItem;
}

+ (UIBarButtonItem *)backButtonDarkItemWithTarget:(id)target action:(SEL)action
{
    // Create back button
    UIButton *backButton = UIButton.new;
    backButton.frame = CGRectMake(0, 0, 50, 50);
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -42, 0, 0);
    
    // Set image
    [backButton setImage:[UIImage imageNamed:@"icn-back-gray"] forState:UIControlStateNormal];
    
    // Set target
    [backButton addTarget:target
                   action:action
         forControlEvents:UIControlEventTouchUpInside];
    
    // Create back bar button item
    UIBarButtonItem *backItem =
    [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    return backItem;
}

+ (void)setupNavigationBarAppearance
{
    // make navigation bar transparent
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
    
    // remove navigation bar shadow
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    
    // set bar tint color - only appears when navigation bar is not translucent
    //[[UINavigationBar appearance] setBarTintColor:kIMPYellow];
    
    // set title font and color
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSForegroundColorAttributeName : [UIColor whiteColor],
       NSFontAttributeName : font(kBariolRegular, 19)}];
}

+ (void)setupTabBarAppearance
{
    NSDictionary *titleTextAttributesDictionary =
    @{NSFontAttributeName: font(kBariolLight, 12)};
    
    [[UITabBarItem appearance] setTitleTextAttributes:titleTextAttributesDictionary
                                             forState:UIControlStateNormal];
}
@end
