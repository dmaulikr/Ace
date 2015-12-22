//
//  SwipeCollectionView.h
//  Ace
//
//  Created by Takomborerwa Mazarura on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeCollectionView : UIView<UICollectionViewDataSource, UICollectionViewDelegate>

#pragma mark - Configure View (Private)

@property (nonatomic, strong) NSMutableArray *usersItems;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, assign) int itemIndex;

@property (nonatomic, assign) int isReload;

@property (nonatomic, assign) PFFile *profilePic;

#pragma mark - Configure View (Public)

- (void)configureWithUser:(PFUser *)user;

@end
