//
//  ADView.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/20.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^GoBackBlock)();
@interface ADView : UIView
@property(nonatomic,retain)NSArray * imageArray;
-(id)initWithArray:(NSArray *)array andFrame:(CGRect)frame andBlock:(GoBackBlock)block;
@end
