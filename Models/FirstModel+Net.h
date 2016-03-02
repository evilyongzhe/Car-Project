//
//  FirstModel+Net.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/23.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "FirstModel.h"

typedef void(^FirstBlock)(NSMutableArray * array,NSError * error);

@interface FirstModel (Net)

+(void)requestPage:(NSInteger)page completionBlock:(FirstBlock)block;
@end
