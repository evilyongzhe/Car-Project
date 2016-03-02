//
//  AnswerModel+Net.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/24.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "AnswerModel.h"
typedef void(^Completion)(NSMutableArray *array,NSError *error);

@interface AnswerModel (Net)
+(void)requestPage:(NSInteger)page completionBlock:(Completion)block;
@end
