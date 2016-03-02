//
//  SearchDetailViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/25.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "SearchDetailViewController.h"
#import "CommonDefin.h"
#import "AFNetworking.h"
#import "NetDefine.h"
#import "SearchDetailCell.h"
#import "SearchDetailModel.h"
#import "SSDetailModel.h"
#import "UIImageView+WebCache.h"
#import "SearchViewController.h"
#import "BrandModel.h"
#define kSearchDetailCell @"searchDetail"
@interface SearchDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation SearchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self loadData];
}
-(void)configUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"SearchDetailCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kSearchDetailCell];
}
-(void)loadData{
    NSString * urlStr = [NSString stringWithFormat:kDazhongUrl,self.SDId];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray * rootArray = dict[@"manufacturers"];
        for (NSDictionary * dict in rootArray) {
            SearchDetailModel * model = [[SearchDetailModel alloc]initWithDictionary:dict error:nil];
            [self.dataArray addObject:model.serials];
            
//            NSLog(@"&&&&&&&&&&%@",self.dataArray);
            
        }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error %@",error);
    }];
}
#pragma mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(NSMutableArray*)self.dataArray[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchDetailCell * cell = [_tableView dequeueReusableCellWithIdentifier:kSearchDetailCell];
    SSDetailModel * model = self.dataArray[indexPath.section][indexPath.row];
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:model.photo]];
    cell.nameLabel.text = model.name;
    cell.priceLabel.text = model.priceRange;
    cell.sellPlaceLabel.text = model.kind;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    SearchDetailViewController * SDVc = [[SearchDetailViewController alloc]init];
//    BrandModel * model = self.dataArray[indexPath.item];
//    SDVc.SDId = model.uid;
//    [self.navigationController pushViewController:SDVc animated:NO];
//}

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }return _dataArray;
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
