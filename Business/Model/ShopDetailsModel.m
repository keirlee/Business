//
//  ShopDetailsModel.m
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ShopDetailsModel.h"

@implementation ShopDetailsModel
@synthesize mobile,sid,address,description,add_time,email,fanwei,hangye,lxr,province;
-(void)dealloc
{
    self.mobile = nil;
    self.sid = nil;
    self.address = nil;
    self.description = nil;
    self.add_time = nil;
    self.email = nil;
    self.fanwei = nil;
    self.hangye = nil;
    self.lxr = nil;
    self.province = nil;
    [super dealloc];
}
@end
