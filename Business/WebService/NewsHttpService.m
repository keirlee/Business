//
//  NewsHttpService.m
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "NewsHttpService.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "NewsCateModel.h"
@implementation NewsHttpService
-(void)getNewsCateListWithComplete:(GetNewsListCompleteBlock)complete andFail:(GetNewsListFailBlock)fail
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?act=news_cate",WebServiceURL]];
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        NSDictionary *dic = [responseString objectFromJSONString];
        if (![[dic objectForKey:@"errorid"] isEqualToString:@"0"]) {
            fail([dic objectForKey:@"message"]);
        }else{
            NSArray *array = [dic objectForKey:@"list"];
            NSMutableArray *modelArray = [NSMutableArray array];
            for (NSDictionary *tmpDic in array) {
                NewsCateModel *model = [[NewsCateModel alloc] initWithDictionary:tmpDic];
                [modelArray addObject:model];
            }
            complete(modelArray);
        }
        
    }];
    [request setFailedBlock:^{
        NSError *error = [request error];
        fail(error.localizedDescription);
    }];
    [request startAsynchronous];
}
@end
