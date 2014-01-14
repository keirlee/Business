//
//  ProductHttpService.m
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ProductHttpService.h"
#import "ProductsCateModel.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"
#import "ProductsListModel.h"
@implementation ProductHttpService
-(void)getProductCateListWithPid:(NSString *)pid andComplete:(GetProductCateListCompleteBlock)complete andFail:(GetProductCateFailBlock)fail
{
    
    NSURL *url = nil;
    if ([pid isEqualToString:@"0"]) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?act=products_cate",WebServiceURL]];
    }
    else{
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?act=_cate&pid=%@",WebServiceURL,pid]];
    }
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
                ProductsCateModel *model = [[ProductsCateModel alloc] initWithDictionary:tmpDic];
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

-(void)getProductListWithPid:(NSString *)pid andSid:(NSString *)sid andKeyWord:(NSString *)keyWord andPage:(NSString *)page andOrderBy:(NSString *)order andComplete:(GetProductListCompleteBlock)complete andFail:(GetProductListFailBlock)fail
{
    NSURL *url = nil;
    url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?act=product_list",WebServiceURL]];
    __weak ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request addPostValue:pid forKey:@"pid"];
    [request addPostValue:sid forKey:@"sid"];
    [request addPostValue:keyWord forKey:@"keyword"];
    [request addPostValue:page forKey:@"page"];
    [request addPostValue:order forKey:@"orderby"];
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        NSDictionary *dic = [responseString objectFromJSONString];
        if (![[dic objectForKey:@"errorid"] isEqualToString:@"0"]) {
            fail([dic objectForKey:@"message"]);
        }else{
            NSArray *array = [dic objectForKey:@"list"];
            NSMutableArray *modelArray = [NSMutableArray array];
            for (NSDictionary *tmpDic in array) {
                ProductsListModel *model = [[ProductsListModel alloc] initWithDictionary:tmpDic];
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
