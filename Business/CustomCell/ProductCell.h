//
//  ProductCell.h
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCell : UITableViewCell
@property(nonatomic,strong)IBOutlet UIImageView *imageView;
@property(nonatomic,strong)IBOutlet UILabel *lblTitle;
@property(nonatomic,strong)IBOutlet UILabel *lblDetail;
@property(nonatomic,strong)IBOutlet UILabel *lblPrice;
@end
