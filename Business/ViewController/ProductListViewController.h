//
//  ProductListViewController.h
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "BaseViewController.h"
#import "SDSegmentedControl.h"
@interface ProductListViewController : BaseViewController
@property(nonatomic,strong)IBOutlet UITableView *mainTable;
@property(nonatomic,strong)NSString *pid;
@property(nonatomic,strong)NSString *sid;
@property(nonatomic,strong)NSString *keyword;
@property(nonatomic,strong)IBOutlet SDSegmentedControl *segment;
- (IBAction)segmentDidChange:(SDSegmentedControl *)sender;
@end
