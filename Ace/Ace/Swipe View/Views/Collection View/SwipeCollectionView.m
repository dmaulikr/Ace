//
//  SwipeCollectionView.m
//  Ace
//
//  Created by Takomborerwa Mazarura on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "SwipeCollectionView.h"

#import "SwipeViewUserCollectionViewCell.h"

@implementation SwipeCollectionView

#pragma mark - Configure View (Private)

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
        
        self.backgroundColor = [UIColor whiteColor];
    
    [self initializeSubviews];
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        
        [self initializeSubviews];
    }
    
    return self;
}

#pragma mark - View configuration

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initializeSubviews];
    
}

- (void)initializeSubviews
{
    [self prepareView];
    
    [self setupVariables];
    
    [self setupCollectionView];
    
    [self setupLabels];
    
}

- (void)prepareView
{
    
    self.backgroundColor = kIMPWhite;
    
    [self registerCollectionViewCells];
    
}

- (void)setupVariables
{
    
    self.usersItems = [[NSMutableArray alloc]init];
    
    self.itemIndex = 0;
    
}

- (void)setupCollectionView
{
    
    CGRect frame = self.frame;
    
    frame.size.height = frame.size.height / 3*2;
    
    frame.origin.y = 0;
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.backgroundColor = kIMPWhite;
    
    self.collectionView.clipsToBounds = YES;
    
    [self.collectionView setDataSource:self];
    
    [self.collectionView setDelegate:self];
    
    [self addSubview:self.collectionView];
    
    [self registerCollectionViewCells];
    
}

- (void)setupLabels
{
    self.infoLabel = UILabel.new;
    self.infoLabel.font = font(kBariolRegular, 16);
    [self.infoLabel setFont:[UIFont boldSystemFontOfSize:16]];
    self.infoLabel.textAlignment = NSTextAlignmentCenter;
    self.infoLabel.text = @"User Name";
    self.infoLabel.textColor = kIMPDarkGrey;
    self.infoLabel.numberOfLines = 3;
    [self.infoLabel sizeToFit];
    self.infoLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.infoLabel];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(10);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
}

- (void)registerCollectionViewCells
{
    
    [self.collectionView registerClass:[SwipeViewUserCollectionViewCell class] forCellWithReuseIdentifier:kSwipeViewUserCollectionViewCellID];
    
}

- (void)configureWithFan:(NSMutableArray *)usersItems
{
    
    [self.collectionView registerClass:[SwipeViewUserCollectionViewCell class] forCellWithReuseIdentifier:kSwipeViewUserCollectionViewCellID];
    
    [self reloadCollectionView];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    int count;
    
    count = 9;
    
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SwipeViewUserCollectionViewCell *cell = (SwipeViewUserCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kSwipeViewUserCollectionViewCellID forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell =  [[SwipeViewUserCollectionViewCell alloc]init];
        
    }
    
    int index = (int)indexPath.row;
    
    if (!self.isReload) {
        
        [cell confureForIndex:index];
        
    }else{
        
        
    }
    
    cell.userImageView.hidden = YES;
    
    if (self.usersItems.count > 0 && self.usersItems.count >= self.itemIndex) {
        
        PFFile *file = [self.usersItems objectAtIndex:self.itemIndex];
        
        switch (index) {
            case 0:
                
                [cell configureWithImageFile:file];
                
                self.itemIndex ++;
                
                break;
                
            case 2:
                
                [cell configureWithImageFile:file];
                
                self.itemIndex ++;
                
                break;
                
            case 3:
                
                [cell configureWithImageFile:file];
                
                self.itemIndex ++;
                
                break;
                
            case 4:
                
                // Profile Picture
                
                if (self.profilePic !=nil) {
                 
                    [cell configureWithImageFile:self.profilePic];
                    
                }else{
                    
                    [cell configureWithUserImage:[FunctionalUtils placeholderImage]];
                    
                }
                
                break;
                
                
            case 6:
                
                [cell configureWithImageFile:file];
                
                self.itemIndex ++;
                
                break;
                
            case 5:
                
                [cell configureWithImageFile:file];
                
                self.itemIndex ++;
                
                break;
                
            case 8:
                
                [cell configureWithImageFile:file];
                
                self.itemIndex ++;
                
                break;
                
            default:
                break;
        }
        
    }
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize mElementSize;
    
    CGFloat height  = self.frame.size.height /5;
    CGFloat width   = self.frame.size.height /5;
    
    CGFloat newWidth    = width;
    CGFloat newHeight   = height;
    
    mElementSize = CGSizeMake(newWidth, newHeight);
    
    return mElementSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    float spacing;
    
    spacing = 0.0;
    
    return spacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    float spacing;
    
    spacing = 0.0;
    
    return 1.0;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0,0,0,0);
    
    insets = UIEdgeInsetsMake(0,0,0,0);
    
    return insets;
    
}

#pragma mark - Configure View (Public)

- (void)configureWithUser:(PFUser *)user
{
    
    self.infoLabel.text = user[@"username"];
    
    self.profilePic = user[@"profilePic"];
    
    PFRelation *interestRelation = [user relationForKey:@"interests"];
    PFQuery *interestQuery = [interestRelation query];
    [interestQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if(!error){
            
            NSLog(@"%lu", [objects count]);
            
            self.usersItems = [[NSMutableArray alloc]init];
            
            for (PFObject*interest in objects) {
                
                PFFile *imageFile = [interest objectForKey:@"image"];
                
                [self.usersItems addObject:imageFile];
                
            }
            
            [self.collectionView reloadData];
            
        }
    }];
}

- (void)configureWithUserItems:(NSMutableArray *)usersItems
{
    
    self.usersItems = [[NSMutableArray alloc]init];
    
    self.usersItems = usersItems;
    
    self.isReload = YES;
    
    [self.collectionView reloadData];
    
}

- (void)reloadCollectionView
{
    
    [self.collectionView reloadData];
    
}

@end
