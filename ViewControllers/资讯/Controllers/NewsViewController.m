//
//  NewsViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/21.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "NewsViewController.h"
#import "TabView.h"
#import "CommonDefin.h"

#import "FirstPageViewController.h"
#import "NewCarViewController.h"
#import "PhotosViewController.h"
#import "VedioViewController.h"


@interface NewsViewController ()<UIScrollViewDelegate,TabViewDelegate>
@property(nonatomic,strong)TabView * tabView;
@property(nonatomic,strong)UIScrollView * mainScrollView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self configUI];
}
-(void)configUI{
    [self setNavigationTitle:@"煮酒论车"];
    
    self.tabView = [[TabView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 50)];
    self.tabView.titleArray = @[@"首页",@"新车",@"评测",@"视频"];
//    NSLog(@"%ld",self.tabView.titleArray.count);
    self.tabView.delagete = self;
    [self.view addSubview:self.tabView];

    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64+50, kScreenWidth, kScreenHeight-64-50-49)];
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.contentSize = CGSizeMake(4*kScreenWidth, kScreenHeight-64-50-49);
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.backgroundColor = [UIColor orangeColor];
    _mainScrollView.delegate = self;
    [self.view addSubview:_mainScrollView];
    [self addChildVc];
    
}
-(void)addChildVc{
    FirstPageViewController * firstVc = [[FirstPageViewController alloc]init];
    NewCarViewController * newVc = [[NewCarViewController alloc]init];
    PhotosViewController * photoVc = [[PhotosViewController alloc]init];
    VedioViewController * vedioVc = [[VedioViewController alloc]init];
    
    [self addChildViewController:firstVc];
    [self addChildViewController:newVc];
    [self addChildViewController:photoVc];
    [self addChildViewController:vedioVc];
    
    
    firstVc.view.frame = CGRectMake(0, 0, kScreenWidth, _mainScrollView.frame.size.height);
    newVc.view.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, _mainScrollView.frame.size.height);
    photoVc.view.frame = CGRectMake(2*kScreenWidth, 0, kScreenWidth, _mainScrollView.frame.size.height);
    vedioVc.view.frame = CGRectMake(3*kScreenWidth, 0, kScreenWidth, _mainScrollView.frame.size.height);
   
    [_mainScrollView addSubview:firstVc.view];
    [_mainScrollView addSubview:newVc.view];
    [_mainScrollView addSubview:photoVc.view];
    [_mainScrollView addSubview:vedioVc.view];
   
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.mainScrollView) {
        NSInteger page = scrollView.contentOffset.x/kScreenWidth;
        [self.tabView resetBtnStatus:page+100];
    }
}
-(void)tabBtn:(NSInteger)page{
    self.mainScrollView.contentOffset = CGPointMake(page*kScreenWidth, 0);
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
