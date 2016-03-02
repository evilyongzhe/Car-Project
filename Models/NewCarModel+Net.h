//
//  NewCarModel+Net.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "NewCarModel.h"
typedef void(^NewBlock)(NSMutableArray * array,NSError * error);

@interface NewCarModel (Net)
+(void)requestPage:(NSInteger)page completionBlock:(NewBlock)block;
@end
