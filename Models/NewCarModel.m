//
//  NewCarModel.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "NewCarModel.h"

@implementation NewCarModel
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"uid",@"cc3d1":@"cc3d-uri",@"touri":@"to-uri",@"vcuri":@"vc-uri",@"vc3d2":@"vc3d-uri"}];
}
@end
