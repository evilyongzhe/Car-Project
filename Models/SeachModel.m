//
//  SeachModel.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/25.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "SeachModel.h"

@implementation SeachModel
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"uid"}];
}

@end
