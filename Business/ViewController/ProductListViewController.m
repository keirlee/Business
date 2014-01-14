//
//  ProductListViewController.m
//  Business
//
//  Created by keirleee on 14-1-8.
//  Copyright (c) 2014年 keirleee. All rights reserved.
//

#import "ProductListViewController.h"
#import "MJRefresh.h"
#import "ProductHttpService.h"
#import "ProductCell.h"
#import "ProductsListModel.h"
#import "UIImageView+WebCache.h"
#import "ProductInfoViewController.h"
@interface ProductListViewController ()<MJRefreshBaseViewDelegate>
{
    NSMutableArray *dataSource;
    MJRefreshHeaderView *_headView;
    MJRefreshFooterView *_footView;
    NSInteger page;
    NSString *currentOrder;
}
@end

@implementation ProductListViewController

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
    //添加下拉刷新
    _headView = [MJRefreshHeaderView header];
    _headView.delegate = self;
    _headView.scrollView = self.mainTable;
    
    
    //添加上拉加载更多
    _footView = [MJRefreshFooterView footer];
    _footView.delegate = self;
    _footView.scrollView = self.mainTable;
    currentOrder = @"";
    page = 1;
    dataSource = [NSMutableArray array];
    
    [self addData:page];
}

-(void)addData:(NSInteger)pages
{
    
    ProductHttpService *service = [[ProductHttpService alloc] init];
    [service getProductListWithPid:self.pid andSid:self.sid andKeyWord:self.keyword andPage:[NSString stringWithFormat:@"%d",pages] andOrderBy:currentOrder andComplete:^(NSArray *array) {
        if (page == 1) {
            [dataSource removeAllObjects];
            //            [cellHeightArray removeAllObjects];
        }
        [dataSource addObjectsFromArray:array];
        [self performSelector:@selector(reloadTable:) withObject:self.mainTable afterDelay:1];
    } andFail:^(NSString *errorInfo) {
        
    }];
//    [service getTransportDemandListByStatus:[NSArray arrayWithObject:@"0806"] andVehicleModel:@"" andTransportDemandViaCompany:@"" andDestinationCompany:@"" andStartTime:@"" andEndTime:@"" andCurPage:[NSString stringWithFormat:@"%d",pages] andComplete:^(NSArray *array) {
//        if (bidPage == 1) {
//            [bidDataSourceArray removeAllObjects];
//            //            [cellHeightArray removeAllObjects];
//        }
//        [bidDataSourceArray addObjectsFromArray:array];
//        if (bidPage == 1) {
//            [self saveDateToPlist];
//        }
//        [app hideHUD];
//        [self performSelector:@selector(reloadTable:) withObject:bidTableView afterDelay:1];
//    } andFails:^(NSString *errorInfo) {
//        bidPage -= 1;
//        [app hideHUD];
//        [app showErrorTipWithLabel:errorInfo view:bidTableView];
//        [self performSelector:@selector(reloadTable:) withObject:bidTableView afterDelay:1];
//    }];
    
}
- (IBAction)segmentDidChange:(SDSegmentedControl *)sender {
    switch (sender.selectedSegmentIndex ) {
        case 0:
            currentOrder = @"1";
            break;
        case 1:
            currentOrder = @"1";
            break;
        case 2:
            currentOrder = @"2";
            break;
        case 3:
            currentOrder = @"3";
            break;
        default:
            break;
    }
    page = 1;
    [dataSource removeAllObjects];
    [self.mainTable reloadData];
    [self addData:page];
}
#pragma mark - 刷新的代理方法---进入下拉刷新\上拉加载更多都有可能调用这个方法
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView == _headView) {
        page = 1;
        [self addData:page];
        //        [self performSelector:@selector(reloadTable:) withObject:currentTableView afterDelay:2];
    }else if (refreshView == _footView){
        page += 1;
        [self addData:page];
        //        [self performSelector:@selector(reloadTable:) withObject:currentTableView afterDelay:2];
    }
}
-(void)reloadTable:(UITableView *)table
{
    
    [_headView endRefreshing];
    [_footView endRefreshing];
    [self.mainTable reloadData];
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * showUserInfoCellIdentifier = [NSString stringWithFormat:@"ShowUserInfoCell%@",[[NSDate date] description]];
    ProductCell * cell = (ProductCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil)
    {
        // Create a cell to display an ingredient.
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProductCell" owner:self options:nil] ;
        
        // 获取nib中的第一个对象
        for (id oneObject in nib){
            // 判断获取的对象是否为自定义cell
            if ([oneObject isKindOfClass:[ProductCell class]]){
                // 4. 修改 cell 对象属性
                cell = [(ProductCell *)oneObject initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
            }
        }
    }
    ProductsListModel *model = [dataSource objectAtIndex:indexPath.row];
    cell.lblTitle.text = model.title;
    cell.lblDetail.text = model.desc;
    cell.lblPrice.text = [NSString stringWithFormat:@"RMB:%@",model.price];
    [cell.imageView setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:[UIImage imageNamed:@"noImg.png"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ProductsCateModel *model = [dataSource objectAtIndex:indexPath.row];
//    if (![model.pid isEqualToString:@"0"]) {
//        ProductSubViewController *productView = [[ProductSubViewController alloc] initWithNibName:@"ProductViewController" bundle:nil];
//        productView.pid = model.pid;
//        [self.navigationController pushViewController:productView animated:YES];
//    }
    ProductsListModel *model = [dataSource objectAtIndex:indexPath.row];
    ProductInfoViewController *infoView = [[ProductInfoViewController alloc] initWithNibName:@"ProductInfoViewController" bundle:nil];
    infoView.pid = model.id;
    [self.navigationController pushViewController:infoView animated:YES];
}
@end
