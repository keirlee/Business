//
//  NewsCateModel.m
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "NewsCateModel.h"

@implementation NewsCateModel
@synthesize nid,title;
-(void)dealloc{
    self.nid = nil;
    self.title = nil;
    [super dealloc];
}
@end
