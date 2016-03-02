//
//  ReduceModel+Net.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/26.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "ReduceModel+Net.h"
#import "AFNetworking.h"
#import "NetDefine.h"
@implementation ReduceModel (Net)
+(void)requestPage:(NSInteger)page completionBlock:(Completion)block{
    NSString * urlStr = [NSString stringWithFormat:kReduceUrl,(long)page];
    
    //1获得manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2设置解析器
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //3发起请求
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //json数据解析
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *dataArray = rootDic[@"data"];
        //把数组中的一个个字典转为模型对象，放到数组中返回给我们
        NSMutableArray *modelArray = [ReduceModel arrayOfModelsFromDictionaries:dataArray];
        //使用block
        block(modelArray,nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
    
    
}

@end
