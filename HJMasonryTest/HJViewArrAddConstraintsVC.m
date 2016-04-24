//
//  HJViewArrAddConstraintsVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJViewArrAddConstraintsVC.h"
#import "Masonry.h"

@interface HJViewArrAddConstraintsVC ()

@end

@implementation HJViewArrAddConstraintsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self testViewArr];
}

#pragma mark - 多个视图统一添加相同的约束
-(void)testViewArr
{
    UIView *view1 = [self createViewWithColor:[UIColor redColor]];
    UIView *view2 = [self createViewWithColor:[UIColor greenColor]];
    UIView *view3 = [self createViewWithColor:[UIColor blackColor]];
    NSArray *viewArr = @[view1, view2, view3];
    
    //1.先通过数组统一设置相同的约束:
    [viewArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(20));
        make.width.equalTo(@(80));
        make.height.equalTo(@(50));
    }];
    
    //2.再分别设置各自缺少的约束:
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
    }];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-15));
    }];
}

@end
