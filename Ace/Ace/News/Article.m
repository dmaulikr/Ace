//
//  Article.m
//  Ace
//
//  Created by Odie Edo-Osagie on 12/12/2015.
//  Copyright © 2015 Odie_Takomborerwa. All rights reserved.
//

#import "Article.h"

@implementation Article

- (id) initWithTitle:(NSString *)t andLink:(NSString *)l andImageLink:(NSString *)i
{
    self = [super init];
    
    if(self){
        _title = t;
        _link = l;
        _imageUrl = i;
    }
    
    return self;
}

@end
