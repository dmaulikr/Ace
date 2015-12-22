//
//  SignupViewController.m
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "SignupViewController.h"
#import "ProfileEditViewController.h"

@interface SignupViewController (){
    BOOL isKeyboardShown;
    float offset;
    
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* Setup activity indicator*/
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = self.view.center;
    [self.view addSubview:activityIndicator];
    
    /* Setup tap recognizer */
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /* Make nav bar COMPLETELY transparent */
    [FunctionalUtils makeNavBar:self.navigationController.navigationBar transparent:YES];
    
    /* Hide back txt */
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /* Register for keyboard notifications */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    /* Unregister for keyboard notifications */
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    /* Show nav bar */
    [FunctionalUtils makeNavBar:self.navigationController.navigationBar transparent:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Keyboard Handling

- (void) keyboardWasShown:(NSNotification *) notification
{
    if(isKeyboardShown){
        return;
    }
    
    isKeyboardShown = YES;
    
    NSDictionary *info = [notification userInfo];
    CGRect keyboardFrame = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    float animationDuration = [info[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    float keyboardHeight = keyboardFrame.size.height;
    offset = (keyboardHeight - 36);
    _bottomConstraint.constant += offset ;
    
    /* Check if top field will intersect with logo image */
    float screenHeight = [[UIScreen mainScreen] bounds].size.height;
    if(screenHeight <= 568){
        _logoImageView.hidden = YES;
    }
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void) keyboardWasHidden:(NSNotification *) notification
{
    isKeyboardShown = NO;
    
    NSDictionary *info = [notification userInfo];
    //CGRect keyboardFrame = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    float animationDuration = [info[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    _bottomConstraint.constant -= offset;
    _signupButton.hidden = NO;
    
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        _logoImageView.hidden = NO;
    }];
}


#pragma mark - Helpers
- (void) showProfileEditPage
{
    ProfileEditViewController *pevc = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileEditViewController2"];
    [self.navigationController pushViewController:pevc animated:YES];
}

# pragma mark - Control Selectors

- (void) didTap
{
    [self.view endEditing:YES];
}

- (IBAction)signupButtonPressed:(id)sender
{
    //[self showProfileEditPage];
    //return;
    
    NSString *username = [[_usernameField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [[_passwordField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *confirmPassword = [[_confirmPasswordFIeld text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([password isEqualToString:confirmPassword]){
        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = password;
        [activityIndicator startAnimating];
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            [activityIndicator stopAnimating];
            
            if(!error){
                // Show image page
                [self showProfileEditPage];
            }
            else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                                message:@"An error occured signing you up. Please try again later"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles: nil];
                [alert show];
            }
        }];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"Please ensure you entered your password correctly both times."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil];
        [alert show];
        return;
    }
}
@end
