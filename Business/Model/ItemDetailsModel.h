//
//  ItemDetailsModel.h
//  Business
//
//  Created by keirleee on 14-1-1.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "Jastor.h"

@interface ItemDetailsModel : Jastor
@property(nonatomic,retain)NSString *id;
@property(nonatomic,retain)NSString *sid;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *desc;
@property(nonatomic,retain)NSString *mobile;
@property(nonatomic,retain)NSArray *logo;
@property(nonatomic,retain)NSString *shop_name;
@end
