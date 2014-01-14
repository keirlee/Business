//
//  ProductsListModel.h
//  Business
//
//  Created by keirleee on 14-1-12.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "Jastor.h"

@interface ProductsListModel : Jastor
@property(nonatomic,retain)NSString *id;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *desc;
@property(nonatomic,retain)NSString *price;
@property(nonatomic,retain)NSString *logo;
@property(nonatomic,retain)NSString *sell;
@end
