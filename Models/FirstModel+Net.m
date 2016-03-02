//
//  FirstModel+Net.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/23.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "FirstModel+Net.h"
#import "AFNetworking.h"
#import "NetDefine.h"
@implementation FirstModel (Net)
+(void)requestPage:(NSInteger)page completionBlock:(FirstBlock)block{
    NSString * urlStr = [NSString stringWithFormat:kFirstUrl,(long)page];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        NSLog(@"%@",dict);
        NSArray * dataArray = dict[@"data"];
        
        NSMutableArray * oneModelArray = [FirstModel arrayOfModelsFromDictionaries:dataArray];
        block(oneModelArray,nil);
//        NSLog(@"one %@",oneModelArray);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];

}
@end
