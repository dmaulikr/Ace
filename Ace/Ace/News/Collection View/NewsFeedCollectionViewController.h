//
//  NewsFeedCollectionViewController.h
//  Ace
//
//  Created by Takomborerwa Mazarura on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeedCollectionViewController : UICollectionViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *parallaxCollectionView;

@end
