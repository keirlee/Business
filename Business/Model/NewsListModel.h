//
//  NewsListModel.h
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "Jastor.h"

@interface NewsListModel : Jastor
@property(nonatomic,retain)NSString *id;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *content;
@property(nonatomic,retain)NSString *number;
@property(nonatomic,retain)NSString *add_time;
@end
