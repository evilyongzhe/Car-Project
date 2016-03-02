//
//  UIBaseViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/20.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "UIBaseViewController.h"
#import "UIColor+Net.h"

@interface UIBaseViewController ()

@end

@implementation UIBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor getTopicColor];
   
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

-(void)addBarButtonItemWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)target action:(SEL)selector isLeft:(BOOL)isLeft{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    //判断是否在哪边显示
    if (isLeft) {
        self.navigationItem.leftBarButtonItem= barItem;
    }else{
        self.navigationItem.rightBarButtonItem = barItem;
    }
    
    
    
}
//导航条设置文字
-(void)setNavigationTitle:(NSString *)title{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:18];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView =  label;
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
