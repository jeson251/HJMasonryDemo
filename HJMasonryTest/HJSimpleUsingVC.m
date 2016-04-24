//
//  HJSimpleUsingVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJSimpleUsingVC.h"
#import "Masonry.h"

@interface HJSimpleUsingVC ()

@end

@implementation HJSimpleUsingVC
{
#if 0
    
    //约束链有返回值, 类型为MASConstraint:
    MASConstraint *constraint = make.width.equalTo(@(100));
    
    make.top;     ==>  view.mas_top;     //顶部
    make.bottom;  ==>  view.mas_bottom;  //底部
    make.left;    ==>  view.mas_left;    //左边
    make.right;   ==>  view.mas_right;   //右边
    make.edges;                          //上左下右内边距
    
    //书写习惯为从左向右的国家或地区, leading为左, trailing为右
    //书写习惯为从右向左的国家或地区, trailing为左, leading为右
    make.leading;   ==>  view.mas_leading;
    make.trailing;  ==>  view.mas_trailing;
    
    make.centerX;   ==>  view.mas_centerX;   //中心点x
    make.centerY;   ==>  view.mas_centerY;   //中心点y
    make.center;                             //中心点
    
    make.width;     ==> view.mas_width;     //宽
    make.height;    ==> view.mas_height;    //高
    make.size;                              //尺寸
    
    
    //UILabel, UIButton等视图显示的 文字的 边沿基准线
    make.baseline;      ==>   view.mas_baseline;        //文字下边沿基准线
    make.firstBaseline; ==>   view.mas_firstBaseline;   //文字上边沿基准线
    make.lastBaseline;  ==>   view.mas_lastBaseline;    //同make.baseline
#endif
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
    [self test2];
    [self test3];
}


#pragma mark - 简单使用
-(void)test1
{
    UIView *redView = [self createViewWithColor:UIColor.redColor];
    
    
    //equalTo的用法:
    //1. width,height,size等约束属性使用equalTo,表示相等;
    //2. 其他约束属性如top,left,bottom,right,centerX等使用equalTo, 表示重合(即间距为0).
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
    }];
    
    //另外还有:
    //小于等于, lessThanOrEqualTo
    //大于等于, greaterThanOrEqualTo
    //用法跟equalTo相同
    
}

#pragma mark - equalTo(参数)
-(void)test2
{
    UIView *blueView = [self createViewWithColor:UIColor.blueColor];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //equalTo传入的参数是一个对象,可以是:
        //1.视图,
        //2.布局属性,
        //3.常量值包装成的对象(基本数据类型包装成NSNumber,结构体包装成NSValue),
        //4.数组(数组元素可以是UIView,布局属性,NSNumber,NSValue).
        
        
        //传一个常量值,表示添加跟父视图相同布局属性的约束:
        make.top.equalTo(@(150));//顶部距离父视图顶部为150
        
        //传一个视图,表示添加跟传入视图相同布局属性的约束:
        make.left.equalTo(self.view);//左边跟self.view的左边重合
        
        //传入一个视图的布局属性,表示添加跟这个布局属性之间的约束:
        make.right.equalTo(self.view.mas_right);//右边跟self.view的右边重合
        
        make.height.equalTo(@(100));
    }];
}

#pragma mark - 一条约束链设置多个布局属性 & 可选语义符:with/and
-(void)test3
{
    UIView *blackView = [self createViewWithColor:[UIColor blackColor]];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //and,with都是可选的语义符, 只是用于增强约束链的可读性
        make.bottom.and.right.equalTo(self.view).with.offset(-10);
        make.width.and.height.equalTo(@(100));
    }];
}

















@end
