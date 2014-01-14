//
//  ProductInfoViewController.h
//  Business
//
//  Created by keirleee on 14-1-12.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "BaseViewController.h"

@interface ProductInfoViewController : BaseViewController
@property(nonatomic,strong)IBOutlet UIWebView *mainWebView;
@property(nonatomic,strong)NSString *pid;
@end
