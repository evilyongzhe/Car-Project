//
//  AnswerModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"

@interface AnswerModel : JSONModel
/*
 "appUrl" : "pcautoclub://bbs-topic/9920366",
 "pic" : "http://img0.pcauto.com.cn/pcauto/forum/club/shequ/wapshequ/wapshequhot/1602/2_8.jpg",
 "summary" : "From：车友【永恆の無淚】 02-24 12:00",
 "title" : "标签：改装 K2 警示灯",
 "topicid" : "",
 "url" : "http://bbs.pcauto.com.cn/topic-9920366.html",
 "userId" : "",
 "userfaceUrl" : ""
 */
@property(nonatomic,copy)NSString <Optional>*appUrl;
@property(nonatomic,copy)NSString <Optional>*pic;
@property(nonatomic,copy)NSString <Optional>*summary;
@property(nonatomic,copy)NSString <Optional>*title;
@property(nonatomic,copy)NSString <Optional>*topicid;
@property(nonatomic,copy)NSString <Optional>*url;
@property(nonatomic,copy)NSString <Optional>*userId;
@property(nonatomic,copy)NSString <Optional>*userfaceUrl;
@end
