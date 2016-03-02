//
//  BrandModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/25.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"

@interface BrandModel : JSONModel
/*
 "hotSerial" : "朗逸、速腾、科鲁兹、福克斯、奥迪A4L、朗动",
 "id" : 0,
 "letter" : "热",
 "logo" : "http://www1.pcauto.com.cn/zt/20131017/app/findCar.png",
 "name" : "热门车系"
 */
@property(nonatomic,copy)NSString <Optional>*hotSerial;
@property(nonatomic,copy)NSString <Optional>*uid;
@property(nonatomic,copy)NSString <Optional>*letter;
@property(nonatomic,copy)NSString <Optional>*logo;
@property(nonatomic,copy)NSString <Optional>*name;


@end
