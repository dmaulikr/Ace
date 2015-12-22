//
//  FunctionalUtils.h
//  Impulse
//
//  Created by Takomborerwa Mazarura on 28/06/2015.
//  Copyright (c) 2015 Impulse. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Parse/Parse.h>

#import "DesignUtils.h"

#import "MBProgressHUD.h"

#import "MDRadialProgressView.h"
#import "MDRadialProgressTheme.h"
#import "MDRadialProgressLabel.h"

// Swipe View

#import "ZLSwipeableView.h"
#import "Utils.h"


#define PROFILE_INTEREST_COUNT 6

@interface FunctionalUtils : NSObject

/** How to document **/

/**
 *
 * @param [param] [Description]: Describes what value should be passed for this parameter
 * @return [Description]: Describes the return value of the method
 * @see [selector]: Provide “see also” reference to related method
 * @warning [description]: Call out exceptional or potentially dangerous behavior
 *
 **/

/** Temlate **/

/**
*
* @param [param] : [Description]
* @return [Description]
* @see [selector]
* @reasoning [description]
* @warning [description]
*
**/

+ (UIImage *) placeholderImage;
+ (void) makeNavBar:(UINavigationBar *)navBar transparent:(BOOL)shouldNavBarTransparent;
+ (void) setText:(NSString *)text andColour:(UIColor *)colour asPlaceholderForTextField:(UITextField *)textField;

@end
