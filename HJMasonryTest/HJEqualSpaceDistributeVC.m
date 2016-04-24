//
//  HJEqualSpaceDistributeVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJEqualSpaceDistributeVC.h"
#import "Masonry.h"
@interface HJEqualSpaceDistributeVC ()
@end
@implementation HJEqualSpaceDistributeVC



#if 0

 设置排列方式:
/**第一种: 固定间距的大小, 自动计算视图的宽或高
 * 第1个参数: 排列方向
 * 第2个参数: 视图之前的固定间隙
 * 第3个参数: 起始间隙, 水平方向时为距离父视图左边的间隙
 * 第4个参数: 尾部间隙
 * 自动计算视图的宽或高
 * 水平方向时, 还需要再添加约束来确定y和高
 * 竖直方向时, 还需要再添加约束来确定x和宽
 */
[viewArr1 mas_distributeViewsAlongAxis:<#(MASAxisType)#> withFixedSpacing:<#(CGFloat)#> leadSpacing:<#(CGFloat)#> tailSpacing:<#(CGFloat)#>];


/**
 *  第二种: 固定视图的宽或高, 自动计算间距的大小
 *  第2个参数为视图固定的宽或高
 *  其他参数跟上面一样
 */
/
[viewArr1 mas_distributeViewsAlongAxis:<#(MASAxisType)#> withFixedItemLength:<#(CGFloat)#> leadSpacing:<#(CGFloat)#> tailSpacing:<#(CGFloat)#>];

#endif



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //水平等间距排列
    [self testDistributeViewsAlongX];
    
    //竖直等间距排列
    [self testDistributeViewsAlongY];
}


#pragma mark - 水平方向排列
-(void)testDistributeViewsAlongX
{
    //第一种,固定视图的宽或高
    
    //需求:
    //1.五个视图水平方向,等间距排列
    //2.每个视图宽40
    //3.与屏幕左右两边的空隙为15
    
    
    //实现:
    //1.创建5个视图,放入数组
    NSMutableArray *viewArr1 = [self createSomeViewsWithCount:5 color:UIColor.redColor];
    
    //2.设置排列方式:
    //水平方向, 视图宽度固定为40, 左右两边空隙都为15, 自动计算视图之间的空隙
    [viewArr1 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:40 leadSpacing:15 tailSpacing:15];
    
    //3.最后补充缺少的约束
    [viewArr1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(2));
        make.height.equalTo(@(20));
    }];
}



#pragma mark - 竖直方向排列
-(void)testDistributeViewsAlongY
{
    //第二种,固定视图之间的空隙
    
    //需求:
    //1.五个视图竖直方向,等间距排列
    //2.视图之间的空隙为20
    //3.与屏幕上下两端的空隙为30
    
    //实现
    //1.创建视图,放入数组
    NSMutableArray *viewArr2 = [self createSomeViewsWithCount:5 color:UIColor.grayColor];
    
    //2.设置排列方式:
    //竖直方向, 视图之间的空隙固定为20, 上下两端空隙都为30, 自动计算视图的高度
    [viewArr2 mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:20 leadSpacing:30 tailSpacing:30];
    
    //3.最后补充缺少的约束
    [viewArr2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.width.equalTo(@(40));
    }];
}


@end
