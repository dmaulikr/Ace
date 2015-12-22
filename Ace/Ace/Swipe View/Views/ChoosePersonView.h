//
//  ChoosePersonView.h
//  Ace
//
//  Created by Takomborerwa Mazarura on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "SwipeCollectionView.h"

@class Person;

@interface ChoosePersonView : MDCSwipeToChooseView <UICollectionViewDataSource, UICollectionViewDelegate>
{
    
    //CGRect frame;
    
    CGFloat intrestImageHeight;
    
    CGFloat secondSetOfImagesStart;
    
    CGFloat thirdSetOfImagesStart;
    
}

@property (nonatomic, strong, readonly) PFUser *person;

@property (strong, nonatomic) NSMutableArray *colours;

@property (strong, nonatomic) SwipeCollectionView *swipeCollectionView;

- (void)configureWithUser:(PFUser*)user;

- (instancetype)initWithFrame:(CGRect)frame
                       person:(PFUser *)person
                      options:(MDCSwipeToChooseViewOptions *)options;



@end
