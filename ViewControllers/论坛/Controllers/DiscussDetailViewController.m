//
//  DiscussDetailViewController.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "DiscussDetailViewController.h"
#import "CommonDefin.h"
#import "NetDefine.h"
@interface DiscussDetailViewController ()
@property(nonatomic,strong)UIWebView * webView;
@end

@implementation DiscussDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    [self.view addSubview:_webView];
    NSString * urlString = self.DiscussId;
    NSURL * url = [NSURL URLWithString:urlString];
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
