//
//  ShopViewController.m
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController ()

@end

@implementation ShopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.navigationController.navigationBarHidden = YES;
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeft.frame = CGRectMake(10, 10, 50, 30);
    btnLeft.tag = 88;
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btnLeft addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [btnLeft setTitle:@"返回" forState:UIControlStateNormal];
    [btnLeft.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btnLeft setHidden:YES];
    [self.navigationController.navigationBar addSubview:btnLeft];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)back
{
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)getData
//{
//    ProductHttpService *service = [[ProductHttpService alloc] init];
//    [service getProductCateListWithPid:self.pid andComplete:^(NSArray *newsList) {
//        dataSource = newsList;
//        [self.mainTable reloadData];
//    } andFail:^(NSString *errorInfo) {
//        NSLog(@"producetcate list error %@",errorInfo);
//    }];
//}
//
//
//#pragma mark - UITableViewDelegate --BOF
//
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    return 1;
//    
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return dataSource.count;
//}
//
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
//    if (cell == nil)
//    {
//        // Create a cell to display an ingredient.
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                      reuseIdentifier:showUserInfoCellIdentifier];
//    }
//    ProductsCateModel *model = [dataSource objectAtIndex:indexPath.row];
//    cell.textLabel.text = model.title;
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    return cell;
//}
//
//
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}

@end
