//
//  ProductsCateModel.m
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ProductsCateModel.h"

@implementation ProductsCateModel
@synthesize title,pid;
-(void)dealloc
{
    self.title = nil;
    self.pid = nil;
    [super dealloc];
}
@end
