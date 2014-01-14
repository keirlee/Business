//
//  ProductHttpService.h
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^GetProductCateListCompleteBlock)(NSArray* newsList);
typedef void (^GetProductCateFailBlock)(NSString *errorInfo);
typedef void (^GetProductListCompleteBlock)(NSArray* array);
typedef void (^GetProductListFailBlock)(NSString *errorInfo);
@interface ProductHttpService : NSObject
-(void)getProductCateListWithPid:(NSString *)pid andComplete:(GetProductCateListCompleteBlock)complete andFail:(GetProductCateFailBlock)fail;
-(void)getProductListWithPid:(NSString *)pid andSid:(NSString *)sid andKeyWord:(NSString *)keyWord andPage:(NSString *)page andOrderBy:(NSString *)order andComplete:(GetProductListCompleteBlock)complete andFail:(GetProductListFailBlock)fail;
@end
