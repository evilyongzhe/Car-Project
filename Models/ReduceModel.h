//
//  ReduceModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/26.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"

@interface ReduceModel : JSONModel
/*
 "aq" : 2,
 "area" : "北京",
 "createTime" : 1456362621000,
 "dealerId" : "77393",
 "dealerName" : "北京玉鸿万达起亚",
 "dealerNewsId" : "12386174",
 "dealerPrice" : "11.28",
 "dealerType" : "综合店",
 "decline" : "44.32",
 "discount" : "50000",
 "district" : "",
 "endTime" : 1457020799000,
 "giftPrice" : "10000",
 "haveGift" : 1,
 "image" : "http://img.pcauto.com.cn/images/upload/upc/tx/auto5/1503/23/c10/4281102_4281102_1427092002708_350x260.jpg",
 "is400" : "1",
 "isShow24Icon" : 0,
 "modelId" : "36186",
 "modelName" : "KX3傲跑 2015款 1.6L 手动GL 2WD ",
 "modelPrice" : "6.28",
 "modelType" : "1",
 "namelistRange" : 3,
 "phone" : "400-016-5132",
 "price" : "6.28",
 "serialGroupId" : 11787,
 "serialGroupName" : "KX3傲跑"
 */
@property(nonatomic,copy)NSString <Optional>*aq;
@property(nonatomic,copy)NSString <Optional>*area;
@property(nonatomic,copy)NSString <Optional>*createTime;
@property(nonatomic,copy)NSString <Optional>*dealerId;
@property(nonatomic,copy)NSString <Optional>*dealerName;
@property(nonatomic,copy)NSString <Optional>*dealerNewsId;
@property(nonatomic,copy)NSString <Optional>*dealerPrice;
@property(nonatomic,copy)NSString <Optional>*dealerType;
@property(nonatomic,copy)NSString <Optional>*decline;
@property(nonatomic,copy)NSString <Optional>*discount;
@property(nonatomic,copy)NSString <Optional>*district;
@property(nonatomic,copy)NSString <Optional>*endTime;
@property(nonatomic,copy)NSString <Optional>*giftPrice;
@property(nonatomic,copy)NSString <Optional>*haveGift;
@property(nonatomic,copy)NSString <Optional>*image;
@property(nonatomic,copy)NSString <Optional>*is400;
@property(nonatomic,copy)NSString <Optional>*isShow24Icon;
@property(nonatomic,copy)NSString <Optional>*modelId;
@property(nonatomic,copy)NSString <Optional>*modelName;
@property(nonatomic,copy)NSString <Optional>*modelPrice;
@property(nonatomic,copy)NSString <Optional>*modelType;
@property(nonatomic,copy)NSString <Optional>*namelistRange;
@property(nonatomic,copy)NSString <Optional>*phone;
@property(nonatomic,copy)NSString <Optional>*price;
@property(nonatomic,copy)NSString <Optional>*serialGroupId;
@property(nonatomic,copy)NSString <Optional>*serialGroupName;

@end
