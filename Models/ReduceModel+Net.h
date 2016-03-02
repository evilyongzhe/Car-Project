//
//  ReduceModel+Net.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/26.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "ReduceModel.h"
typedef void(^Completion)(NSMutableArray *array,NSError *error);
@interface ReduceModel (Net)
+(void)requestPage:(NSInteger)page completionBlock:(Completion)block;
@end
