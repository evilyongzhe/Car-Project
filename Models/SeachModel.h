//
//  SeachModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/25.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"
#import "BrandModel.h"

@protocol BrandModel <NSObject>



@end
@interface SeachModel : JSONModel
/*
 "brands" : [
 {
 "hotSerial" : "朗逸、速腾、科鲁兹、福克斯、奥迪A4L、朗动",
 "id" : 0,
 "letter" : "热",
 "logo" : "http://www1.pcauto.com.cn/zt/20131017/app/findCar.png",
 "name" : "热门车系"
 }
 ],
 "index" : "热",
 "rowNum" : 0
 */
@property(nonatomic,strong)NSArray <BrandModel> * brands;
@property(nonatomic,copy)NSString *index;
@property(nonatomic,copy)NSString *rowNum;

@end
