//
//  FirstModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/22.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"

@interface FirstModel : JSONModel
/*articleType" : "n",
"channelId" : 2,
"channelName" : "新车",
"classfy" : "",
"count" : 10,
"downs" : 0,
"id" : "7773127",
"image" : "http://img0.pcauto.com.cn/pcauto/1602/22/g_7773127_1456109147509_240x160.jpg",
"pubDate" : "2016-02-22",
"title" : "东风风光580科技配置曝光 搭10寸屏幕",
"type" : 1,
"ups" : 65,
"url" : "http://www.pcauto.com.cn/nation/777/7773127.html",
"voteId" :
*/
@property(nonatomic,copy)NSString *articleType;
@property(nonatomic,copy)NSString *channelId;
@property(nonatomic,copy)NSString *channelName;
@property(nonatomic,copy)NSString *classfy;
@property(nonatomic,copy)NSString *count;
@property(nonatomic,copy)NSString *downs;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *pubDate;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *ups;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *voteId;

@end
