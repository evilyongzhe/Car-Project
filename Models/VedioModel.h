//
//  VedioModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"

@interface VedioModel : JSONModel
/*
 "bigCover" : "http://img.pcauto.com.cn/images/autovideo/autovideo/20162/23/14562119457755620_s5.jpg",
 "categoryName" : "试车视频",
 "desc" : "",
 "duration" : "00:17:18",
 "durationSimple" : "17:18",
 "id" : 47000,
 "image" : "http://img.pcauto.com.cn/images/autovideo/autovideo/20162/23/14562119457755620_s2.jpg",
 "isYuanChuang" : 0,
 "midCover" : "http://img.pcauto.com.cn/images/autovideo/autovideo/20162/23/14562119457755620_s4.jpg",
 "pubDate" : "2016-02-23",
 "shortName" : "新车评网年度策划——弯路",
 "title" : "新车评网年度策划——弯路（中集）",
 "type" : 9,
 "url" : "http://v.pcauto.com.cn/video-47000.html",
 "viewCount" : 599
 */
@property(nonatomic,copy)NSString <Optional>*bigCover;
@property(nonatomic,copy)NSString <Optional>*categoryName;
@property(nonatomic,copy)NSString <Optional>*desc;
@property(nonatomic,copy)NSString <Optional>*duration;
@property(nonatomic,copy)NSString <Optional>*durationSimple;
@property(nonatomic,copy)NSString <Optional>*uid;
@property(nonatomic,copy)NSString <Optional>*image;
@property(nonatomic,copy)NSString <Optional>*isYuanChuang;
@property(nonatomic,copy)NSString <Optional>*midCover;
@property(nonatomic,copy)NSString <Optional>*pubDate;
@property(nonatomic,copy)NSString <Optional>*shortName;
@property(nonatomic,copy)NSString <Optional>*title;
@property(nonatomic,copy)NSString <Optional>*type;
@property(nonatomic,copy)NSString <Optional>*url;
@property(nonatomic,copy)NSString <Optional>*viewCount;
@end
