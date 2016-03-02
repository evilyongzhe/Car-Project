//
//  SearchViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/21.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "SearchViewController.h"
#import "SeachModel.h"
#import "SearchCell.h"
#import "AFNetworking.h"
#import "NetDefine.h"
#import "MBProgressHUD.h"
#import "CommonDefin.h"
#import "UIImageView+WebCache.h"
#import "BrandModel.h"
#import "SearchDetailViewController.h"
#define kSearchCell @"search"
@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self configUI];
}
-(void)configUI{
    [self setNavigationTitle:@"煮酒论车"];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"SearchCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kSearchCell];
}
-(void)loadData{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
   [manager GET:kSearchBrandUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
       NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       NSArray * sectionsArray = dict[@"sections"];
       for (NSDictionary * dict in sectionsArray) {
           SeachModel * model = [[SeachModel alloc]initWithDictionary:dict error:nil];
           [self.dataSource addObject:model.brands];
       }
       [self.tableView reloadData];
   } failure:^(NSURLSessionDataTask *task, NSError *error) {
       NSLog(@"error %@",error);
   }];
}
#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(NSMutableArray*)self.dataSource[section] count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchCell * cell = [tableView dequeueReusableCellWithIdentifier:kSearchCell];
    BrandModel * model = self.dataSource[indexPath.section][indexPath.row];
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    cell.nameLabel.text = model.name;
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 80;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth, 25)];
    view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
    UILabel * label = [[UILabel alloc]initWithFrame:view.frame];
    if (section == 0) {
        label.text = @"";
    }else{
    unichar ch = section-1+'A';
    label.text = [NSString stringWithUTF8String:(char*)&ch];
    
    }
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchDetailViewController * SDVc = [[SearchDetailViewController alloc]init];
    BrandModel * model = self.dataSource[indexPath.section][indexPath.row];
    SDVc.SDId = model.uid;
    SDVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:SDVc animated:YES];
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
