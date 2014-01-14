//
//  ItemDetailsModel.m
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ItemDetailsModel.h"

@implementation ItemDetailsModel
@synthesize title,sid,mobile,logo,desc,id,shop_name;
+ (Class)logo_class {
	return [NSString class];
}
-(void)dealloc
{
    self.title = nil;
    self.shop_name = nil;
    self.desc = nil;
    self.logo = nil;
    self.mobile = nil;
    self.sid = nil;
    [super dealloc];
}
@end
