//
//  UIBaseViewController.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/20.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBaseViewController : UIViewController
//设置导航条的标题
-(void)setNavigationTitle:(NSString *)title;

/**  给导航条添加一个按钮
 *  @param title     按钮的文字
 *  @param imageName 按钮的背景图片
 *  @param target    对象
 *  @param selector  方法
 *  @param isLeft    导航条的那一边  YES 左侧 NO 右侧
 */
-(void)addBarButtonItemWithTitle:(NSString *)title imageName:(NSString *)imageName target:(id)target action:(SEL)selector isLeft:(BOOL)isLeft;
@end
