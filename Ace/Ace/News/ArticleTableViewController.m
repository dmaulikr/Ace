//
//  ArticleTableViewController.m
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "ArticleTableViewController.h"
#import "Article.h"
#import "UIImageView+WebCache.h"
#import "ArticleTableViewCell.h"
#import "WebViewController.h"

@interface ArticleTableViewController (){
    NSMutableArray *articleArray;
}

@end

@implementation ArticleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Articles and Information";
    
    articleArray = [[NSMutableArray alloc] initWithArray:@[
                                                           [[Article alloc] initWithTitle:@"Here are the 11 biggest asexual myths busted" andLink:@"http://www.gaystarnews.com/article/here-are-11-biggest-asexual-myths-busted300315/#gs.zHJ5gXE" andImageLink:@"https://images.taboola.com/taboola/image/fetch/dpr_2.0%2Cf_jpg%2Cq_80%2Ch_146%2Cw_291%2Cc_fill%2Cg_faces%2Ce_sharpen/http%3A//www.gaystarnews.com/wp-content/uploads/2015/10/nick-jonas-scream.jpg"],
                                                           [[Article alloc] initWithTitle:@"What it's like to be asexual" andLink:@"http://www.telegraph.co.uk/men/relationships/11820220/What-its-like-to-be-asexual.html" andImageLink:@"http://www.soc.ucsb.edu/sexinfo/sites/default/files/files/styles/large/public/field/image/a2.jpg"],
                                                           [[Article alloc] initWithTitle:@"Robbins ’11 is lead author of landmark paper on asexual coming-out experience" andLink:@"https://www.bates.edu/news/2015/10/16/robbins-lead-author-landmark-paper-on-asexual-coming-out-experience/" andImageLink:@"http://www.bates.edu/news/files/2015/10/image1-225x300.jpg"],
                                                           [[Article alloc] initWithTitle:@"Learning About Asexuality Helped Me Become Comfortable In My Own Skin" andLink:@"http://www.mtv.com/news/2357741/asexuality-awareness-education/" andImageLink:@"http://imagesmtv-a.akamaihd.net/uri/mgid:uma:image:mtv.com:11003893?quality=0.8&format=jpg&width=1200&height=675"],
                                                           [[Article alloc] initWithTitle:@"UCLA Panel Sheds Light On Asexuality" andLink:@"http://www.canyon-news.com/ucla-panel-sheds-light-on-asexuality/42067" andImageLink:@"http://www.canyon-news.com/wp-content/uploads/2015/10/wpid-received_10153190800286430-1074x483.jpeg"],
                                                           [[Article alloc] initWithTitle:@"Asexual People Answer Questions You Have" andLink:@"http://www.buzzfeed.com/kennymoffitt/asexual-people-answer-questions-you-have#.unmQrl0Vp" andImageLink:@"http://s3-ak.buzzfeed.com/static/2015-11/20/18/campaign_images/webdr12/asexual-people-answer-questions-you-have-2-28557-1448062321-0.jpg"],
                                                           [[Article alloc] initWithTitle:@"I’m Asexual But I’m Not…" andLink:@"http://www.buzzfeed.com/kennymoffitt/im-asexual-but-im-not#.esQpeo69v" andImageLink:@"http://s3-ak.buzzfeed.com/static/2015-11/23/13/campaign_images/webdr07/im-asexual-but-im-not-2-28445-1448301656-0.jpg"],
                                                           [[Article alloc] initWithTitle:@"I’m Asexual But I’m Not…" andLink:@"http://www.buzzfeed.com/henryloevner/15-poignant-asexual-confessions#.xl2rK0WAw" andImageLink:@"http://s3-ak.buzzfeed.com/static/2015-08/21/17/campaign_images/webdr08/15-poignant-asexual-confessions-2-24124-1440191063-9.jpg"]
                                                           ]];
    
    /* STyle tv */
    self.tableView.separatorInset = UIEdgeInsetsZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [articleArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleTableViewCell *cell = (ArticleTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Article *article = articleArray[indexPath.row];
    [cell.articleImageView sd_setImageWithURL:[NSURL URLWithString:[article imageUrl]] placeholderImage:[FunctionalUtils placeholderImage]];
    cell.articleTextLabel.text = [article title];
    
    return cell;
}



- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Article *article = articleArray[indexPath.row];
    WebViewController *wvc = [self.storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    wvc.pageTitle = [article title];
    wvc.pageLink = [article link];
    
    [self.navigationController pushViewController:wvc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
