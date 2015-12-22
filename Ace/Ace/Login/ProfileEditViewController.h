//
//  ProfileEditViewController.h
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileEditViewController : UIViewController<UITableViewDataSource, UITabBarControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *interestImages;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) UIImage *image;

@property (weak, nonatomic) IBOutlet UIImageView *profilePicImageView;
@property (weak, nonatomic) IBOutlet UIButton *profilePicButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


- (IBAction)profilePicButtonPressed:(id)sender;

@end
