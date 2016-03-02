//
//  DIscussViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/21.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "DIscussViewController.h"
#import "AnswerModel+Net.h"
#import "CommonDefin.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "MBProgressHUD.h"
#import "AnswerCell.h"
#import "DiscussDetailViewController.h"

@interface DIscussViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,assign)NSInteger currentPage;
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)MBProgressHUD * hud;

@end

@implementation DIscussViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    [self loadData];
    [self configUI];
}
-(void)configUI{
    [self setNavigationTitle:@"论坛"];
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 5, 10);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-50) collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"AnswerCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"answer"];
    _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refreshData];
    }];
    _collectionView.footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    
}
-(void)refreshData{
    _currentPage = 1;
    [self loadData];
}
-(void)loadMoreData{
    _currentPage++;
    [self loadData];
}
-(void)loadData{
    [self.view addSubview:self.hud];
    [self.hud show:YES];
    [AnswerModel requestPage:_currentPage completionBlock:^(NSMutableArray *array, NSError *error) {
        if (error == nil) {
            if (_currentPage == 1) {
                [self.dataSource removeAllObjects];
            }
            [self.dataSource addObjectsFromArray:array];
            [self.collectionView reloadData];
            [_collectionView.header endRefreshing];
            [_collectionView.footer endRefreshing];
        }else{
            NSLog(@"error %@",error);
        }
        [self.hud hide:YES];
    }];
}
#pragma mark UICollectionDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AnswerCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"answer" forIndexPath:indexPath];
    AnswerModel * model = self.dataSource[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.commomLabel.text = model.summary;
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    return cell;
}
#pragma mark UICollectionViewDelegateFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake((kScreenWidth-30)/2, 180);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AnswerModel * model = self.dataSource[indexPath.row];
    DiscussDetailViewController * discussDeVc = [[DiscussDetailViewController alloc]init];
   discussDeVc.DiscussId = model.url;
    discussDeVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:discussDeVc animated:NO];
}
-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
        
    }return _dataSource;
}
-(MBProgressHUD *)hud{
    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc]initWithView:self.view];
        _hud.labelText = @"正在加载";
    }
    return _hud;
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
