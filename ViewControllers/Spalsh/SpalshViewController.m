//
//  SpalshViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/20.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "SpalshViewController.h"
#import "AppDelegate.h"
#import "CommonDefin.h"
#import "ADView.h"

#import "ReduceViewController.h"
//#import "MIneViewController.h"
#import "NewsViewController.h"
#import "DIscussViewController.h"
#import "SearchViewController.h"
#import "UIColor+Net.h"


@interface SpalshViewController ()

@end

@implementation SpalshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self isFirstStartApp]) {
        [self showGuide];
    }else{
        [self goMain];
    }
}

//判断是否是第一次启动程序
-(BOOL)isFirstStartApp{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * number = [defaults objectForKey:kAppFirstLoadKey];
    if (number!=nil) {
        NSInteger startNum = [number integerValue];
        NSString * str = [NSString stringWithFormat:@"%lu",(long)++startNum];
        [defaults setObject:str forKey:kAppFirstLoadKey];
        [defaults synchronize];
        return NO;
    }else{
        [defaults setObject:@"1" forKey:kAppFirstLoadKey];
        [defaults synchronize];
        return YES;
    }
}
-(void)showGuide{
    NSArray * imageArray = @[@"1126kpctpsjbz6.jpg",@"24489503_1376520046617.jpg",@"ooYBAFKpNdmIGeLOAAMOUDjqLFcAABKMgI81lwAAw5o667.jpg",@"oYYBAFVvqKKIAtCiAAKO_T7ETVEAAChWQHkIPEAAo8V768.jpg"];
    ADView * adView = [[ADView alloc]initWithArray:imageArray andFrame:kScreenBounds andBlock:^{
        [self goMain];
    }];
    [self.view addSubview:adView];
}
-(void)goMain{
    NSArray * normalArray = @[@"btn_tabbar_1@2x",@"btn_tabbar_2@2x",@"btn_tabbar_3@2x",@"btn_tabbar_4@2x",@"btn_tabbar_5@2x"];
    NSArray * selectArray = @[@"btn_tabbar_1_hl@2x",@"btn_tabbar_2_hl@2x",@"btn_tabbar_3_hl@2x",@"btn_tabbar_4_hl@2x"];
//    NSArray * titleArray = @[@"资讯",@"论坛",@"找车",@"优惠",@"我的"];
    
    NewsViewController * newsVc = [[NewsViewController alloc]init];
    DIscussViewController * disVc = [[DIscussViewController alloc]init];
//    MineViewController * mineVc = [[MineViewController alloc]init];
    ReduceViewController * redeceVc = [[ReduceViewController alloc]init];
    SearchViewController * searchVc = [[SearchViewController alloc]init];
    UINavigationController * newsNa = [[UINavigationController alloc]initWithRootViewController:newsVc];
    UINavigationController * disNa = [[UINavigationController alloc]initWithRootViewController:disVc];
    UINavigationController * reduceNa = [[UINavigationController alloc]initWithRootViewController:redeceVc];
    UINavigationController * searchNa = [[UINavigationController alloc]initWithRootViewController:searchVc];
//    UINavigationController * mineNa = [[UINavigationController alloc]initWithRootViewController:mineVc];
    newsNa.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:normalArray[0]] selectedImage:[[UIImage imageNamed:selectArray[0]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
   
    disNa.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:normalArray[1]] selectedImage:[[UIImage imageNamed:selectArray[1]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    searchNa.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:normalArray[2]] selectedImage:[[UIImage imageNamed:selectArray[2]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    reduceNa.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:normalArray[3]] selectedImage:[[UIImage imageNamed:selectArray[3]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    mineNa.tabBarItem = [[UITabBarItem alloc]initWithTitle:nil image:[UIImage imageNamed:normalArray[4]] selectedImage:[[UIImage imageNamed:selectArray[4]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UITabBarController * tabVc = [[UITabBarController alloc]init];
    tabVc.viewControllers = @[newsNa,disNa,reduceNa,searchNa];
    tabVc.tabBar.barTintColor = [UIColor getTopicColor];
   
    
    AppDelegate * de = [UIApplication sharedApplication].delegate;
    de.window.rootViewController = tabVc;

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
