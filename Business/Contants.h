//
//  Contants.h
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#ifndef Business_Contants_h
#define Business_Contants_h
#import "MBProgressHUD.h"
#define WEbURL @"http://www.cxzg.com/cxpt/ind_2/"
#define NewsWebURL @"http://www.cxzg.com/cxpt/ind/n_cate.php?ios=1"
#define WebServiceURL @"http://www.cxzg.com/cxpt/webservices/v1.0/"
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#ifndef IOS_VERSION
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#endif
#endif
