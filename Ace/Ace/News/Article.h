//
//  Article.h
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *imageUrl;

- (id) initWithTitle:(NSString *)t andLink:(NSString *)l andImageLink:(NSString *)i;

@end
