//
//  TabView.h
//  煮酒论车
//
//  Created by 张羽 on 16/2/22.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TabViewDelegate <NSObject>

-(void)tabBtn:(NSInteger)page;

@end
@interface TabView : UIView

@property(nonatomic,strong)NSArray * titleArray;

@property(nonatomic,weak)id<TabViewDelegate>delagete;

-(void)resetBtnStatus:(NSInteger)btnTag;

@end
