//
//  HJArrParameterVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJArrParameterVC.h"
#import "Masonry.h"

@interface HJArrParameterVC ()

@end

@implementation HJArrParameterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testArrayParameters];
}


#pragma mark - 将数组作为参数,传给equalTo()
-(void)testArrayParameters
{
    UIView *view1 = [self createViewWithColor:[UIColor redColor]];
    UIView *view2 = [self createViewWithColor:[UIColor greenColor]];
    UIView *view3 = [self createViewWithColor:[UIColor blackColor]];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@(20));
        make.right.equalTo(view2.mas_left).offset(-20);
        make.bottom.equalTo(view3.mas_top).offset(-20);
        make.width.equalTo(view2);
        
        //设置三个视图等高
        make.height.equalTo(@[view2, view3]);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(20));
        make.right.equalTo(@(-20));
    }];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(20));
        make.bottom.right.equalTo(@(-20));
    }];
}

@end
