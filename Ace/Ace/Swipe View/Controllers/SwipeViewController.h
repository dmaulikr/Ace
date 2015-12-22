//
//  SwipeViewController.h
//  Ace
//
//  Created by Takomborerwa Mazarura on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChoosePersonView.h"

@interface SwipeViewController : UIViewController <MDCSwipeToChooseDelegate>

@property (nonatomic, strong) PFUser *currentPerson;

@property (nonatomic, strong) ChoosePersonView *frontCardView;

@property (nonatomic, strong) ChoosePersonView *backCardView;

@end
