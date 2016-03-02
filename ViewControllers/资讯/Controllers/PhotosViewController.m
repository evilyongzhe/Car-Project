//
//  PhotosViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/22.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "PhotosViewController.h"
#import "PredictModel.h"
#import "AFNetworking.h"
#import "NetDefine.h"
#import "PredictCell.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "MBProgressHUD.h"
#import "PredictModel+Net.h"
#import "PhotoDetailViewController.h"
#import "CommonDefin.h"
#define kPredict @"predict"
@interface PhotosViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,assign)NSInteger currentPage;
@property(nonatomic,strong)MBProgressHUD * hud;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refreshData];
    [self configUI];
}
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }return _dataSource;
}
-(void)configUI{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"PredictCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kPredict];
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
    [PredictModel requestPage:_currentPage completionBlock:^(NSMutableArray *array, NSError *error) {
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
    
    PredictCell * cell = [tableView dequeueReusableCellWithIdentifier:kPredict forIndexPath:indexPath];
    PredictModel * model = self.dataSource[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.commentLabel.text = [NSString stringWithFormat:@"%@ 评论",model.count];
    cell.dateLabel.text = model.pubDate;
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:model.image]];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PredictModel * model = self.dataSource[indexPath.row];
    PhotoDetailViewController * predictDeVc = [[PhotoDetailViewController alloc]init];
    predictDeVc.predictId = model.url;
    predictDeVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:predictDeVc animated:NO];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
    UILabel * label = [[UILabel alloc]initWithFrame:view.bounds];
    label.text = @"最新评测";
    label.textColor = [UIColor brownColor];
    [view addSubview:label];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
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
