//
//  ProfileEditViewController.m
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "ProfileEditViewController.h"
#import "InterestCollectionViewCell.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface ProfileEditViewController (){
    NSIndexPath *lastSelectedIndexPath;
    BOOL isSelectingProfilePic;
    UIBarButtonItem *doneButton;
    UIImage *interestPlaceholderImage;
    
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation ProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.hidesBackButton = YES;
    
    self.view.backgroundColor = kIMPYellow;
    _profilePicImageView.image = [UIImage imageNamed:@"avatarPlaceholder"];
    _profilePicImageView.layer.cornerRadius = _profilePicImageView.frame.size.width/2;
    _profilePicImageView.clipsToBounds = YES;
    _profilePicImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    _profilePicImageView.layer.borderWidth = 2.5;
    _profilePicImageView.contentMode = UIViewContentModeScaleAspectFill;
    _collectionView.backgroundColor = [UIColor colorFromHexString:@"6A6A6A"];
    /* Create and initialise array */
    _interestImages = [NSMutableArray new];
    interestPlaceholderImage = [UIImage imageNamed:@"upload"];
    for(int i = 0; i < PROFILE_INTEREST_COUNT; i++){
        _interestImages[i] = interestPlaceholderImage;
    }
    
    /* Prepare image picker */
    _imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    _imagePickerController.allowsEditing = NO;
    _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _imagePickerController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:_imagePickerController.sourceType];
    
    /* Add right bar button */
    doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    [doneButton setEnabled:NO];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    /* Setup activity indicator*/
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = self.view.center;
    [self.view addSubview:activityIndicator];
    
    /* Show infromative alert */
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                   message:@"Please upload 6 images that identify your interests. You may optionally, upload a profile picture."
                                                  delegate:nil
                                         cancelButtonTitle:@"Ok"
                                         otherButtonTitles: nil];
    [alert show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return PROFILE_INTEREST_COUNT; // row +1 for header
}

#pragma mark - Table View Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"interestCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"UPLOAD IMAGE";
    cell.imageView.image = _interestImages[indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    isSelectingProfilePic = NO;
    lastSelectedIndexPath = [indexPath copy];

    [self presentViewController:_imagePickerController animated:NO completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return PROFILE_INTEREST_COUNT;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InterestCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell
    cell.imageView.image = _interestImages[indexPath.row];
    
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    isSelectingProfilePic = NO;
    lastSelectedIndexPath = [indexPath copy];
    
    [self presentViewController:_imagePickerController animated:NO completion:nil];
}


#pragma mark - ImagePicker delegate

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    
    /*  Check if a photo was taken or selected  */
    if([mediaType  isEqual:(NSString *)kUTTypeImage]){
        UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        /*  Check if new photo was taken with camera so we know whether to save it  */
        if(_imagePickerController.sourceType == UIImagePickerControllerSourceTypePhotoLibrary ||
           _imagePickerController.sourceType == UIImagePickerControllerSourceTypeSavedPhotosAlbum){
            if(!isSelectingProfilePic){
                [self updateInterestImageForRowWithIndex:lastSelectedIndexPath withImage:selectedImage];
            }
            else{
                _image = selectedImage;
                _profilePicImageView.image = _image;
            }
        }
    }
    else{
        // TODO: ALERT SAYING CAN ONLY PICK PHOTOS
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Helpers

-  (void) updateInterestImageForRowWithIndex:(NSIndexPath *)indexPath withImage:(UIImage *)newImage
{
    _interestImages[indexPath.row] = newImage;
    UITableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
    InterestCollectionViewCell *cell2 = (InterestCollectionViewCell*) [_collectionView cellForItemAtIndexPath:indexPath];
    cell.imageView.image = newImage;
    cell2.imageView.image = newImage;
    
    int filledInterestCount = 0;
    for(UIImage *image in _interestImages){
        if(image != interestPlaceholderImage){
            filledInterestCount++;
        }
    }
    
    if(filledInterestCount == PROFILE_INTEREST_COUNT){
        [doneButton setEnabled:YES];
    }
}

- (UIImage *) resizeImage: (UIImage *) image toWidth: (float)width andHeight:(float)height
{
    CGSize newSize = CGSizeMake(width, height);
    CGRect newRect = CGRectMake(0, 0, width, height);
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:newRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void) uploadMessage
{
    [activityIndicator startAnimating];
    
    NSData *fileData;
    NSString *fileName;
    NSString *fileType;
    
    PFUser *user = [PFUser currentUser];
    PFRelation *interestRelation = [user relationForKey:@"interests"];
    
    /* Upload interests */
    for(UIImage *image in _interestImages){
        fileData = UIImagePNGRepresentation([self resizeImage:image toWidth:100 andHeight:100]);
        fileName = @"image.png";
        fileType = @"image";

        PFFile *file = [PFFile fileWithName:fileName data:fileData];
        [file save];
        PFObject *interest = [PFObject objectWithClassName:@"Interest"];
        interest[@"image"] = file;
        [interest save];
        
        
        [interestRelation addObject:interest];
    }
    
    /* Upload profile pic */
    if([_profilePicImageView image]){
        fileData = UIImagePNGRepresentation([self resizeImage:[_profilePicImageView image] toWidth:100 andHeight:100]);
        fileName = @"profilePic.png";
        PFFile *file = [PFFile fileWithName:fileName data:fileData];
        [file save];
        user[@"profilePic"] = file;
    }
    
    [user saveInBackground];
    
    [activityIndicator stopAnimating];
}



#pragma mark - Control Selectors

- (void) doneButtonPressed
{
    [self uploadMessage];

    [self.navigationController popViewControllerAnimated:NO];
    UITabBarController *main = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabController"];
    [self presentViewController:main animated:YES completion:nil];
}

- (IBAction)profilePicButtonPressed:(id)sender
{
    isSelectingProfilePic = YES;
    [self presentViewController:_imagePickerController animated:NO completion:nil];
}


@end
