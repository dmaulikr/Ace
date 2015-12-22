//
//  FunctionalUtils.m
//  Impulse
//
//  Created by Takomborerwa Mazarura on 28/06/2015.
//  Copyright (c) 2015 Impulse. All rights reserved.
//

#import "FunctionalUtils.h"

@implementation FunctionalUtils


+ (UIImage *) placeholderImage
{
    return [UIImage imageNamed:@"logo-512"];
}


+ (void) makeNavBar:(UINavigationBar *)navBar transparent:(BOOL)shouldNavBarTransparent
{
    if(shouldNavBarTransparent){
        [navBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        navBar.shadowImage = [[UIImage alloc] init];
        navBar.translucent = YES;
    }
    else{
        [navBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        navBar.shadowImage = nil;
        navBar.translucent = YES;
    }
}

+ (void) setText:(NSString *)text andColour:(UIColor *)colour asPlaceholderForTextField:(UITextField *)textField
{
    NSAttributedString *usernamePlaceolder = [[NSAttributedString alloc] initWithString:text attributes:@{ NSForegroundColorAttributeName : colour }];
    textField.attributedPlaceholder = usernamePlaceolder;
}


@end
