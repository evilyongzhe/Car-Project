//
//  NewCarModel.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "JSONModel.h"

@interface NewCarModel : JSONModel
/*
 "articleType" : "n",
 "count" : 8,
 "downs" : 0,
 "firstImg" : "http://img0.pcauto.com.cn/pcauto/1602/24/7783088_1_thumb.jpg",
 "id" : "7783088",
 "image" : "http://img0.pcauto.com.cn/pcauto/1602/24/g_7783088_1456279557202_240x160.jpg",
 "pubDate" : "2016-02-24",
 "title" : "神秘路虎揽胜测试车 或为中期改款车型",
 "ups" : 0,
 "url" : "http://www.pcauto.com.cn/nation/778/7783088.html"
 
 "cc3d-uri" : "",
 "image" : "http://imgad0.pcauto.com.cn/ivy/image/20162/19/14558699810800.jpg",
 "isExtend" : 1,
 "pubDate" : "2016-02-24",
 "title" : "上汽大众全新帕萨特 时代所向由你选择",
 "to-uri" : "http://ivy.pcauto.com.cn/adpuba/click?adid=398413&id=auto.khd.zx.xc.d10w.&__uuid=202693",
 "vc-uri" : "http://ivy.pcauto.com.cn/adpuba/show?adid=398413&id=auto.khd.zx.xc.d10w.&media=js",
 "vc3d-uri" : ""

 */
@property(nonatomic,copy)NSString <Optional>* articleType;
@property(nonatomic,copy)NSString <Optional>* count;
@property(nonatomic,copy)NSString <Optional>* downs;
@property(nonatomic,copy)NSString <Optional>* firstImg;
@property(nonatomic,copy)NSString <Optional>* uid;
@property(nonatomic,copy)NSString <Optional>* image;
@property(nonatomic,copy)NSString <Optional>* pubDate;
@property(nonatomic,copy)NSString <Optional>* title;
@property(nonatomic,copy)NSString <Optional>* ups;
@property(nonatomic,copy)NSString <Optional>* url;
@property(nonatomic,copy)NSString <Optional>* cc3d1;
@property(nonatomic,copy)NSString <Optional>* isExtend;
@property(nonatomic,copy)NSString <Optional>* touri;
@property(nonatomic,copy)NSString <Optional>* vcuri;
@property(nonatomic,copy)NSString <Optional>* vc3d2;

@end
