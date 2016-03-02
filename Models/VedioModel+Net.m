//
//  VedioModel+Net.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "VedioModel+Net.h"
#import "AFNetworking.h"
#import "NetDefine.h"
@implementation VedioModel (Net)
+(void)requestPage:(NSInteger)page completionBlock:(NewBlock)block{
    NSString * urlStr = [NSString stringWithFormat:kVedioUrl,(long)page];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        NSLog(@"%@",dict);
        NSMutableArray * dataArray = dict[@"data"];
        
        NSMutableArray * newArray = [VedioModel arrayOfModelsFromDictionaries:dataArray];
        //        NSLog(@" dataArray %@",oneModelArray);
        block(newArray,nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
    }];
    
}

@end
