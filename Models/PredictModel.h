//
//  PredictModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"

@interface PredictModel : JSONModel
/*
 "articleType" : "n",
 "count" : 56,
 "downs" : 0,
 "firstImg" : "http://img.pcauto.com.cn/images/pcautogallery/modle/article/20162/24/14562774543982840_600.jpg",
 "id" : "7780933",
 "image" : "http://img0.pcauto.com.cn/pcauto/1602/23/g_7780933_1456229540978_240x160.jpg",
 "pubDate" : "2016-02-24",
 "title" : "另辟蹊径 测试全新大众宝来1.4TSI",
 "ups" : 39,
 "url" : "http://www.pcauto.com.cn/pingce/778/7780933.html"
 */
@property(nonatomic,copy)NSString *articleType;
@property(nonatomic,copy)NSString *count;
@property(nonatomic,copy)NSString *downs;
@property(nonatomic,copy)NSString *firstImg;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *pubDate;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *ups;
@property(nonatomic,copy)NSString *url;

@end
