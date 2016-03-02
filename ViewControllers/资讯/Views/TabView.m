//
//  TabView.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/22.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "TabView.h"
#import "CommonDefin.h"
#import "UIColor+Net.h"

@interface TabView ()
@property(nonatomic,assign)NSInteger lastBtnTag;
@end

@implementation TabView
-(void)setTitleArray:(NSArray *)titleArray{
    //按钮的间距和宽度和高度
    CGFloat kBtnSpace = 0;
    CGFloat kBtnWidth = (kScreenWidth-kBtnSpace*(titleArray.count))/titleArray.count;;
    CGFloat kBtnHeight = self.frame.size.height;
    for (int i = 0; i<titleArray.count; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(kBtnSpace + i * (kBtnSpace + kBtnWidth), 0, kBtnWidth, kBtnHeight)];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor getTopicColor] forState:UIControlStateSelected];
        btn.tag = 100+i;
        btn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            btn.selected = YES;
            _lastBtnTag = i+100;
        }
        [self addSubview:btn];
    }
}
-(void)onClick:(UIButton *)btn{
    UIButton * lastBtn = [self viewWithTag:_lastBtnTag];
    lastBtn.selected = NO;
    btn.selected = YES;
    _lastBtnTag = btn.tag;
    if (_delagete &&[_delagete respondsToSelector:@selector(tabBtn:)]) {
        [_delagete tabBtn:btn.tag -100];
    }else{
        NSLog(@"没有设置代理或者没有代理没有实现协议方法");
    }
    
}
-(void)resetBtnStatus:(NSInteger)btnTag{
    UIButton * lastBtn = [self viewWithTag:_lastBtnTag];
    lastBtn.selected = NO;
    UIButton * selectBtn = [self viewWithTag:btnTag];
    selectBtn.selected = YES;
    _lastBtnTag = btnTag;
}
@end
