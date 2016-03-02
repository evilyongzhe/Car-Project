//
//  ReduceViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/21.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "ReduceViewController.h"
#import "CommonDefin.h"
#import "NetDefine.h"
#import "AFNetworking.h"
#import "ReduceCell.h"
#import "ReduceModel.h"
#import "ReduceModel+Net.h"
#import "MBProgressHUD.h"
#import "MJRefresh.h"
#import "ReduceDetailViewController.h"
#define kReduceCell @"reduce"
@interface ReduceViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,assign)NSInteger currentPage;
@property(nonatomic,strong)MBProgressHUD * hud;

@end

@implementation ReduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadData];
}
-(void)configUI{
    [self setNavigationTitle:@"煮酒论车"];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"ReduceCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kReduceCell];

    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    [self refreshData];
    }];
    _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
    [self loadMoreData];
}];
}
-(void)loadData{
    
    [self.view addSubview:self.hud];
    [self.hud show:YES];
    [ReduceModel requestPage:_currentPage completionBlock:^(NSMutableArray *array, NSError *error) {
        if(error == nil){
            if (_currentPage == 1) {
                [self.dataSource removeAllObjects];
            }
            [self.dataSource addObjectsFromArray:array];
            [self.tableView reloadData];
            [_tableView.header endRefreshing];
            [_tableView.footer endRefreshing];
        }else {
            NSLog(@"error %@",error);
        }
        [self.hud hide:YES];
    }];
    
}
-(void)refreshData{
    _currentPage = 1;
    [self loadData];
}
-(void)loadMoreData{
    _currentPage ++;
    [self loadData];
}

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReduceCell * cell = [tableView dequeueReusableCellWithIdentifier:kReduceCell forIndexPath:indexPath];
    ReduceModel * model = self.dataSource[indexPath.row];
    cell.nameLabel.text = model.modelName;
    cell.placeLabel.text = model.dealerName;
    cell.priceLabel.text = [NSString stringWithFormat:@"¥ %@万",model.price];
    
    cell.discountLabel.text = [NSString stringWithFormat:@"↓¥ %.2f万",[model.discount floatValue]/10000.0 ];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ReduceModel * model = self.dataSource[indexPath.row];
    ReduceDetailViewController * reduceDeVc = [[ReduceDetailViewController alloc]init];
    reduceDeVc.newsId = model.dealerNewsId;
    reduceDeVc.groupId = model.modelId;
    reduceDeVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:reduceDeVc animated:NO];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
    UILabel * label = [[UILabel alloc]initWithFrame:view.bounds];
    label.text = @"最新优惠";
    label.textColor = [UIColor brownColor];
    [view addSubview:label];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }return _dataSource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
