//
//  PredictModel.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "PredictModel.h"

@implementation PredictModel
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"uid"}];
}
@end
