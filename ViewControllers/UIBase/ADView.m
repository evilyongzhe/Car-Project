//
//  ADView.m
//  煮酒论车
//
//  Created by 张羽 on 16/2/20.
//  Copyright © 2016年 张羽. All rights reserved.
//

#import "ADView.h"
#define  WIDTH self.frame.size.width
#define  HEIGHT self.frame.size.height

@interface ADView ()<UIScrollViewDelegate>
{
    NSInteger _currentPage; //记录当前的显示页
}
@property(nonatomic,copy) GoBackBlock  goBlock;

@end

@implementation ADView

-(id)initWithArray:(NSArray *)array andFrame:(CGRect)frame andBlock:(GoBackBlock)block{
    if (self = [super init]) {
        self.frame = frame;
        NSMutableArray * arr = [NSMutableArray arrayWithArray:array];
        NSString * s0 = array[0];
        NSString * tailS = array[array.count-1];
        [arr insertObject:tailS atIndex:0];
        [arr addObject:s0];
        self.imageArray = [NSArray arrayWithArray:arr];
        [self configUI];
        self.goBlock = block;
    }
    return self;
}
-(void)configUI{
    UIScrollView * scr = [[UIScrollView alloc]initWithFrame:self.bounds];
    scr.backgroundColor = [UIColor yellowColor];
    NSArray * imageArray = self.imageArray;
    for (int i = 0; i<imageArray.count; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*WIDTH, 0, WIDTH, HEIGHT)];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        imageView.backgroundColor = [UIColor blackColor];
        imageView.userInteractionEnabled = YES;
        [scr addSubview:imageView];
        if(i == imageArray.count-2){
            UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
            [btn addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
            btn.backgroundColor = [UIColor clearColor];
            [imageView addSubview:btn];
        }
    }
    scr.contentSize = CGSizeMake(imageArray.count * WIDTH, HEIGHT);
    scr.contentOffset = CGPointMake(WIDTH, 0);
    scr.bounces = NO;
    scr.delegate = self;
    scr.pagingEnabled = YES;
    scr.showsHorizontalScrollIndicator = NO;
    [self addSubview:scr];
    UIPageControl * page = [[UIPageControl alloc]initWithFrame:CGRectMake(250, 250, 100, 50)];
    page.numberOfPages = imageArray.count - 2;
    page.currentPageIndicatorTintColor = [UIColor whiteColor];
    _currentPage = 1;
    page.currentPage = _currentPage-1;
    page.tag = 20;
    
}
-(void)go{
    self.goBlock();
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    if (point.x == 0) {
        scrollView.contentOffset = CGPointMake(WIDTH*(self.imageArray.count-2),0);
        
    }
    if (point.x == WIDTH * (self.imageArray.count -1)) {
        scrollView.contentOffset = CGPointMake(WIDTH, 0);
    }
    UIPageControl * page = (UIPageControl *)[self viewWithTag:20];
    _currentPage = scrollView.contentOffset.x/WIDTH;
    page.currentPage = _currentPage -1;
    
}
@end
