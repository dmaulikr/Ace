//
//  WebViewController.h
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic, strong) NSString *pageTitle;
@property (nonatomic, strong) NSString *pageLink;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
