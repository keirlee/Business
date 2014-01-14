//
//  ProductSubViewController.m
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ProductSubViewController.h"
#import "ProductsCateModel.h"
#import "ProductHttpService.h"
#import "ProductListViewController.h"
@interface ProductSubViewController ()
{
    NSArray *dataSource;
}
@end

@implementation ProductSubViewController

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
    [self getData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getData
{
    ProductHttpService *service = [[ProductHttpService alloc] init];
    [service getProductCateListWithPid:self.pid andComplete:^(NSArray *newsList) {
        dataSource = newsList;
        [self.mainTable reloadData];
    } andFail:^(NSString *errorInfo) {
        NSLog(@"producetcate list error %@",errorInfo);
    }];
}


#pragma mark - UITableViewDelegate --BOF

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        // Create a cell to display an ingredient.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:showUserInfoCellIdentifier];
    }
    ProductsCateModel *model = [dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductsCateModel *model = [dataSource objectAtIndex:indexPath.row];
    ProductListViewController *listView = [[ProductListViewController alloc] initWithNibName:@"ProductListViewController" bundle:nil];
    listView.pid = model.pid;
    [self.navigationController pushViewController:listView animated:YES];
}
@end
