//
//  NewsListModel.m
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "NewsListModel.h"

@implementation NewsListModel
@synthesize title,add_time,content,id,number;
-(void)dealloc
{
    self.title = nil;
    self.add_time = nil;
    self.content = nil;
    self.id = nil;
    self.number = nil;
    [super dealloc];
}
@end
