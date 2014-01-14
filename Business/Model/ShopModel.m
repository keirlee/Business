//
//  ShopModel.m
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel
@synthesize title,address,desc,logo,mobile,sid;
-(void)dealloc
{
    self.title = nil;
    self.address = nil;
    self.desc = nil;
    self.logo = nil;
    self.mobile = nil;
    self.sid = nil;
    [super dealloc];
}
@end
