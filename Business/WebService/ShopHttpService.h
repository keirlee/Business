//
//  ShopHttpService.h
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^GetShopListCompleteBlock)(NSArray* newsList);
typedef void (^GetShopListFailBlock)(NSString *errorInfo);
@interface ShopHttpService : NSObject
-(void)getProductCateListWithPid:(NSString *)pid andComplete:(GetShopListCompleteBlock)complete andFail:(GetShopListFailBlock)fail;
@end
