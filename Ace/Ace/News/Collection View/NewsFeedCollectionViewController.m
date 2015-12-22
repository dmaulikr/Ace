//
//  NewsFeedCollectionViewController.m
//  Ace
//
//  Created by Takomborerwa Mazarura on 13/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "NewsFeedCollectionViewController.h"

#import "NewsFeedCollectionViewCell.h"

#import "Article.h"

#import "UIImageView+WebCache.h"

#import "ArticleTableViewCell.h"

#import "WebViewController.h"

@interface NewsFeedCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *articleArray;

@end

@implementation NewsFeedCollectionViewController

#pragma mark - UIView Life Cycle

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self setupNavigationBar];
 
    [self setupCollectionView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupViewData];
    
    [self.parallaxCollectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Status Bar

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Navigation Bar

- (void)setupNavigationBar
{
    self.title = @"News";
    
    self.navigationController.navigationBar.barTintColor = kIMPYellow;
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)setupNavigationItemForUpload
{
    
    self.navigationItem.hidesBackButton = NO;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: kIMPDarkGrey};
    
}
#pragma mark - Setup collection view appearance

- (void)setupCollectionView
{
    
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat navBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat statusBarHeight = statusBarFrame.size.height;
    
    CGFloat topMargin = navBarHeight + statusBarHeight;
    
    [self.collectionView setContentInset:UIEdgeInsetsMake(-topMargin, 0, 0, 0)];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Setup View Data

- (void)setupViewData
{
    self.articleArray = [[NSMutableArray alloc] initWithArray:@[
                                                           [[Article alloc] initWithTitle:@"Here are the 11 biggest asexual myths busted" andLink:@"http://www.gaystarnews.com/article/here-are-11-biggest-asexual-myths-busted300315/#gs.zHJ5gXE" andImageLink:@"https://images.taboola.com/taboola/image/fetch/dpr_2.0%2Cf_jpg%2Cq_80%2Ch_146%2Cw_291%2Cc_fill%2Cg_faces%2Ce_sharpen/http%3A//www.gaystarnews.com/wp-content/uploads/2015/10/nick-jonas-scream.jpg"],
                                                           [[Article alloc] initWithTitle:@"What it's like to be asexual" andLink:@"http://www.telegraph.co.uk/men/relationships/11820220/What-its-like-to-be-asexual.html" andImageLink:@"http://www.soc.ucsb.edu/sexinfo/sites/default/files/files/styles/large/public/field/image/a2.jpg"],
                                                           [[Article alloc] initWithTitle:@"Robbins ’11 is lead author of landmark paper on asexual coming-out experience" andLink:@"https://www.bates.edu/news/2015/10/16/robbins-lead-author-landmark-paper-on-asexual-coming-out-experience/" andImageLink:@"http://www.bates.edu/news/files/2015/10/image1-225x300.jpg"],
                                                           [[Article alloc] initWithTitle:@"Learning About Asexuality Helped Me Become Comfortable In My Own Skin" andLink:@"http://www.mtv.com/news/2357741/asexuality-awareness-education/" andImageLink:@"http://imagesmtv-a.akamaihd.net/uri/mgid:uma:image:mtv.com:11003893?quality=0.8&format=jpg&width=1200&height=675"],
                                                           [[Article alloc] initWithTitle:@"UCLA Panel Sheds Light On Asexuality" andLink:@"http://www.canyon-news.com/ucla-panel-sheds-light-on-asexuality/42067" andImageLink:@"http://www.canyon-news.com/wp-content/uploads/2015/10/wpid-received_10153190800286430-1074x483.jpeg"],
                                                           [[Article alloc] initWithTitle:@"Asexual People Answer Questions You Have" andLink:@"http://www.buzzfeed.com/kennymoffitt/asexual-people-answer-questions-you-have#.unmQrl0Vp" andImageLink:@"http://s3-ak.buzzfeed.com/static/2015-11/20/18/campaign_images/webdr12/asexual-people-answer-questions-you-have-2-28557-1448062321-0.jpg"],
                                                           [[Article alloc] initWithTitle:@"I’m Asexual But I’m Not…" andLink:@"http://www.buzzfeed.com/kennymoffitt/im-asexual-but-im-not#.esQpeo69v" andImageLink:@"http://s3-ak.buzzfeed.com/static/2015-11/23/13/campaign_images/webdr07/im-asexual-but-im-not-2-28445-1448301656-0.jpg"],
                                                           [[Article alloc] initWithTitle:@"I’m Asexual But I’m Not…" andLink:@"http://www.buzzfeed.com/henryloevner/15-poignant-asexual-confessions#.xl2rK0WAw" andImageLink:@"http://s3-ak.buzzfeed.com/static/2015-08/21/17/campaign_images/webdr08/15-poignant-asexual-confessions-2-24124-1440191063-9.jpg"]
                                                           ]];
   
}

#pragma mark - UICollectionViewDatasource Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.articleArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NewsFeedCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [[cell contentView] setFrame:[cell bounds]];
    [[cell contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

    Article *article = [self.articleArray objectAtIndex:indexPath.row];
    
    [cell.JiggyImageView sd_setImageWithURL:[NSURL URLWithString:[article imageUrl]] placeholderImage:[FunctionalUtils placeholderImage]];
    
    [cell setupImageOffset];
    
    cell.storyHeadline.text = [article title];
    
    cell.storyMiniDescription.text = @"";
    
    CGFloat yOffset = ((self.parallaxCollectionView.contentOffset.y - cell.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
    
    cell.imageOffset = CGPointMake(0.0f, yOffset);
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    Article *article = [self.articleArray objectAtIndex:indexPath.row];
    WebViewController *wvc = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    wvc.pageTitle = [article title];
    wvc.pageLink = [article link];
    
    [self.navigationController pushViewController:wvc animated:YES];

    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 150);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    // Distance between cells
    
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    // Distance between cells in different sections
    
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //top,left,botttom,right
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


#pragma mark - UIScrollViewdelegate methods

/**
 
 So as the scoll view is scrolled update the yOffset
 This way the image moves its sposition up or down
 
 **/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    for(NewsFeedCollectionViewCell *view in self.parallaxCollectionView.visibleCells) {
        
        CGFloat yOffset = ((self.parallaxCollectionView.contentOffset.y - view.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
        
        view.imageOffset = CGPointMake(0.0f, yOffset);
    }
}

#pragma mark - Back Button

-(void)backPressed
{
    
}

@end
