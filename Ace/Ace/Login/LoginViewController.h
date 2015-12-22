//
//  LoginViewController.h
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UILabel *taglineLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;


- (IBAction)loginButtonPressed:(id)sender;
- (IBAction)signUpButtonPressed:(id)sender;


@end
