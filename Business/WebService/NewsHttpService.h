//
//  NewsHttpService.h
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GetNewsListCompleteBlock)(NSArray* newsList);
typedef void (^GetNewsListFailBlock)(NSString *errorInfo);

@interface NewsHttpService : NSObject

-(void)getNewsCateListWithComplete:(GetNewsListCompleteBlock)complete andFail:(GetNewsListFailBlock)fail;
@end
