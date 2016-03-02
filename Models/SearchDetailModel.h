//
//  SearchDetailModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/25.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"
#import "SSDetailModel.h"

@protocol SSDetailModel <NSObject>



@end
@interface SearchDetailModel : JSONModel
/*
 "brandIntroduction" : "http://baike.pcauto.com.cn/204.html",
 "brandName" : "奥迪",
 "name" : "一汽奥迪",
 "serials" : [

 */
@property(nonatomic,strong)NSArray <SSDetailModel> * serials;
@property(nonatomic,copy)NSString *brandIntroduction;
@property(nonatomic,copy)NSString *brandName;
@property(nonatomic,copy)NSString *name;
@end
