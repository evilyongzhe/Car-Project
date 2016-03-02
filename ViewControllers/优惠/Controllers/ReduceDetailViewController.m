//
//  ReduceDetailViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/26.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "ReduceDetailViewController.h"
#import "CommonDefin.h"
#import "NetDefine.h"
@interface ReduceDetailViewController ()
@property(nonatomic,strong)UIWebView * webView;
@end

@implementation ReduceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    [self.view addSubview:_webView];
    NSString * urlString = self.newsId;
    NSString * urlString2 = self.groupId;
    NSString * urlStr = [NSString stringWithFormat:kReduceDeUrl,urlString,urlString2];
    NSURL * url = [NSURL URLWithString:urlStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
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
