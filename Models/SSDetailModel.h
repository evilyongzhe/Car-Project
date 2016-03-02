//
//  SSDetailModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/25.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"

@interface SSDetailModel : JSONModel
/*
 "carField" : 4,
 "carVersion" : 1,
 "count" : 58,
 "id" : 3524,
 "isNew" : 0,
 "kind" : "中型车",
 "name" : "奥迪A4L",
 "photo" : "http://img.pcauto.com.cn/images/upload/upc/tx/auto5/1601/04/c28/17185298_17185298_1451874243609_180x135.jpg",
 "priceRange" : "27.28~57.81 万",
 "sellStatus" : 3
 */
@property(nonatomic,copy)NSString <Optional>*carField;
@property(nonatomic,copy)NSString <Optional>*carVersion;
@property(nonatomic,copy)NSString <Optional>*count;
@property(nonatomic,copy)NSString <Optional>*uid;
@property(nonatomic,copy)NSString <Optional>*isNew;
@property(nonatomic,copy)NSString <Optional>*kind;
@property(nonatomic,copy)NSString <Optional>*name;
@property(nonatomic,copy)NSString <Optional>*photo;
@property(nonatomic,copy)NSString <Optional>*priceRange;
@property(nonatomic,copy)NSString <Optional>*sellStatus;
@end
