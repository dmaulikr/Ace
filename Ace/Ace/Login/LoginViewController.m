//
//  LoginViewController.m
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "LoginViewController.h"
#import "SignupViewController.h"

@interface LoginViewController (){
    BOOL isKeyboardShown;
    float offset;
    
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if([PFUser currentUser]){
        [self enterApp];
        //[PFUser logOut];
        
    }
    
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
    _signupButton.hidden = YES;
    
    /* Check if top field will intersect with logo image */
    float screenHeight = [[UIScreen mainScreen] bounds].size.height;
    if(screenHeight <= 568){
        _logoImageView.hidden = YES;
        _taglineLabel.hidden = YES;
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
        _taglineLabel.hidden = NO;
    }];
}

# pragma mark - Helpers

- (void) enterApp
{
    UITabBarController *main = [self.storyboard instantiateViewControllerWithIdentifier:@"mainTabController"];
    [self presentViewController:main animated:YES completion:nil];
}

# pragma mark - Control Selectors

- (void) didTap
{
    [self.view endEditing:YES];
}

- (IBAction)loginButtonPressed:(id)sender
{
    NSString *username = [[_usernameField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [[_passwordField text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
        if(!error){
            [self enterApp];
        }
    }];
}

- (IBAction)signUpButtonPressed:(id)sender
{
    SignupViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SignupViewController"];
    [self.navigationController pushViewController:svc animated:YES];
}
@end
