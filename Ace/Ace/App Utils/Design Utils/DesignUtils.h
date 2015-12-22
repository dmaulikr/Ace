//
//  DesignUtils.h
//  ImpulseUpload
//
//  Created by Takomborerwa Mazarura on 16/05/2015.
//  Copyright (c) 2015 takomborerwa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Masonry.h>
#import <Colours.h>

#define kMainYellow ([UIColor colorFromHexString:@"F1D126"])

#define kMainBlue ([UIColor colorFromHexString:@"47B6E9"])

#define kMainPink ([UIColor colorFromHexString:@"DF31A7"])

#define kMainGray ([UIColor colorFromHexString:@"1F2223"])

#define kIMPYellow ([UIColor colorFromHexString:@"F7F926"])

#define kIMPLightYellow ([UIColor colorFromHexString:@"FFFCAB"])

#define kIMPOrange ([UIColor colorFromHexString:@"FF7F00"])

#define kIMPWhite ([UIColor colorFromHexString:@"FFFFFF"])

#define kIMPBlue ([UIColor colorFromHexString:@"42B0F9"])

#define kIMPLightBlue ([UIColor colorFromHexString:@"61C5F9"])

#define kIMPLighterLightBlue ([UIColor colorFromHexString:@"69FAFA"])

#define kIMPGreen ([UIColor colorFromHexString:@"00FF7A"])

#define kIMPRed ([UIColor colorFromHexString:@"FF0000"])

#define kIMPUltraLightBlue ([UIColor colorFromHexString:@"FBFBFB"])

#define kIMPDarkGrey ([UIColor colorFromHexString:@"555555"])

#define kIMPImageBackgroundGray ([UIColor colorFromHexString:@"EFEFEF"])

#define kIMPUltraDarkGrey ([UIColor colorFromHexString:@"333333"])

#define kIMPMediumLightGray ([UIColor colorFromHexString:@"E8E6E3"])

#define kIMPBlack ([UIColor colorFromHexString:@"000000"])

#define font(_name_, _size_) ((UIFont *)[UIFont fontWithName:(NSString *)(_name_) size:(CGFloat)(_size_)])

static NSString * const kCelebrityDetailStoryboardID = @"celebDetail";
static NSString * const kBariolRegular = @"Bariol-Regular";
static NSString * const kBariolBold = @"Bariol-Bold";
static NSString * const kBariolLight = @"Bariol-Regular";
static NSString * const kBariolItalic = @"BariolRegular-Italic";
static NSString * const kBariolBoldItalic = @"BariolBold-Italic";
static NSString * const kQuicksandBold = @"QuicksandBold-Regular";

@interface DesignUtils : NSObject

+ (UIBarButtonItem *)backButtonItemWithTarget:(id)target
                                       action:(SEL)action;

+ (UIBarButtonItem *)backButtonLightItemWithTarget:(id)target
                                            action:(SEL)action;

+ (UIBarButtonItem *)backButtonDarkItemWithTarget:(id)target
                                           action:(SEL)action;

+ (void)setupNavigationBarAppearance;

+ (void)setupTabBarAppearance;

@end
