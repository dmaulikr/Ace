//
//  ChoosePersonViewImageLabelWidth.m
//  Ace
//
//  Created by Takomborerwa Mazarura on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "ChoosePersonView.h"
#import "ImageLabelView.h"
#import "Person.h"
#import "SwipeCollectionView.h"

static const CGFloat ChoosePersonViewImageLabelWidth = 42.f;

@interface ChoosePersonView ()

@property (nonatomic, strong) UIView *informationView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) ImageLabelView *cameraImageLabelView;

@property (nonatomic, strong) ImageLabelView *interestsImageLabelView;

@property (nonatomic, strong) ImageLabelView *friendsImageLabelView;

@property (nonatomic, strong) UIImageView *profilePicture;

@property (nonatomic, strong) UIImageView *intrestImage1;

@property (nonatomic, strong) UIImageView *intrestImage2;

@property (nonatomic, strong) UIImageView *intrestImage3;

@property (nonatomic, strong) UIImageView *intrestImage4;

@property (nonatomic, strong) UIImageView *intrestImage5;

@property (nonatomic, strong) UIImageView *intrestImage6;

@property (nonatomic, strong) UIImageView *intrestImage7;

@property (nonatomic, strong) UIImageView *intrestImage8;

- (void)configureWithImages:(NSMutableArray*)images;

@end

@implementation ChoosePersonView

#pragma mark - Object Lifecycle

- (instancetype)initWithFrame:(CGRect)frame
                       person:(PFUser *)person
                      options:(MDCSwipeToChooseViewOptions *)options {
    self = [super initWithFrame:frame options:options];
    
    if (self) {
        
        _person = person;
        
        [self declareIntrestImageHeights];
    
        if (self.swipeCollectionView == nil) {
            
            self.swipeCollectionView = [[SwipeCollectionView alloc]initWithFrame:CGRectMake(0, 60, self.frame.size.width, self.frame.size.height)];
            
            [self addSubview:self.swipeCollectionView];
            
            [self.swipeCollectionView configureWithUser:person];
            
        }
    
    }
    
    return self;
}

#pragma mark - Internal Methods

- (void)declareIntrestImageHeights
{
    intrestImageHeight = 50;
    
}

#pragma mark - External Methods

- (void)configureWithUser:(PFUser*)person
{
    
    self.profilePicture.image = person[@"profilePhoto"];
    
    
}

#pragma mark - OLD CODE

- (void)constructInformationView {
    CGFloat bottomHeight = 60.f;
    CGRect bottomFrame = CGRectMake(0,
                                    CGRectGetHeight(self.bounds) - bottomHeight,
                                    CGRectGetWidth(self.bounds),
                                    bottomHeight);
    _informationView = [[UIView alloc] initWithFrame:bottomFrame];
    _informationView.backgroundColor = [UIColor whiteColor];
    _informationView.clipsToBounds = YES;
    _informationView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:_informationView];
    
}

@end
