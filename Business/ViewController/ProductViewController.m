//
//  productViewController.m
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductsCateModel.h"
#import "ProductHttpService.h"
#import "ProductListViewController.h"
#import "ProductSubViewController.h"
#import "ProductListViewController.h"
@interface ProductViewController ()
{
    NSArray *dataSource;
}
@end

@implementation ProductViewController

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
//    self.mainTable.frame = self.view.frame;
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
//    self.mainWebView.scrollView.showsHorizontalScrollIndicator = NO;
//    self.mainWebView.scrollView.showsVerticalScrollIndicator = NO;
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@p_cate.php?ios=1",WEbURL]];
//    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:url]];
}

-(void)back
{
//    [self.mainWebView goBack];
//    UIButton *btn = (UIButton *)[self.navigationController.navigationBar viewWithTag:88];
//    if ([self.mainWebView canGoBack])
//        btn.hidden = NO;
//    else
//        btn.hidden = YES;

}


-(void)getData
{
    ProductHttpService *service = [[ProductHttpService alloc] init];
    [service getProductCateListWithPid:@"0" andComplete:^(NSArray *newsList) {
        dataSource = newsList;
        [self.mainTable reloadData];
    } andFail:^(NSString *errorInfo) {
        NSLog(@"producetcate list error %@",errorInfo);
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    if (![model.pid isEqualToString:@"0"]) {
        ProductSubViewController *productView = [[ProductSubViewController alloc] initWithNibName:@"ProductViewController" bundle:nil];
        productView.pid = model.pid;
        [self.navigationController pushViewController:productView animated:YES];
    }else
    {
        ProductListViewController *listView = [[ProductListViewController alloc] initWithNibName:@"ProductListViewController" bundle:nil];
        listView.pid = model.pid;
        [self.navigationController pushViewController:listView animated:YES];
    }
}


@end
