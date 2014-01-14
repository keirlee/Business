//
//  ProductsListModel.m
//  Business
//
//  Created by keirleee on 14-1-12.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ProductsListModel.h"

@implementation ProductsListModel
@synthesize desc,id,logo,price,sell,title;
-(void)dealloc
{
    self.id = nil;
    self.desc = nil;
    self.logo = nil;
    self.price = nil;
    self.sell = nil;
    self.title = nil;
    [super dealloc];
}
@end
