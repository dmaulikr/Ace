//
//  WebViewController.m
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupCoreView];
    
    [self setupSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Core View Setup (Nav Bar)

- (void)setupCoreView
{
    
    self.view.clipsToBounds = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupStatusBar];
    
    [self setupNavigationBar];
    
    [self setupNavigationItems];
    
}

- (void)setupStatusBar
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)setupNavigationBar
{
    
    self.navigationController.navigationBar.barTintColor = kIMPYellow;
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)setupNavigationItems
{
    
    self.navigationItem.hidesBackButton = NO;
    
    UIBarButtonItem *backItem = [DesignUtils backButtonDarkItemWithTarget:self action:@selector(backButtonPressed)];
    
    backItem.tintColor = [UIColor redColor];
    
    self.navigationItem.leftBarButtonItem = backItem;
    
}

#pragma mark - Setup Subviewss

- (void)setupSubviews
{
    self.webView.backgroundColor = kIMPWhite;
    
    /* Nav bar title */
    
    UILabel *titleView = [[UILabel alloc] init];
    
    titleView.text = _pageTitle;
    
    [titleView sizeToFit];
    
    self.navigationItem.titleView = titleView;
    
    /* Load */
    
    NSURL *url = [NSURL URLWithString:_pageLink];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                         timeoutInterval:60];
    [_webView loadRequest:request];
}


#pragma mark - Navigation

- (void)backButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
