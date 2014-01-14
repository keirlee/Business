//
//  CityModel.m
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel
@synthesize id,name;
-(void)dealloc{
    self.id = nil;
    self.name = nil;
    [super dealloc];
}
@end
