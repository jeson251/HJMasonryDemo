//
//  HJBaseViewCtrl.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//  自定义控制器基类

#import "HJBaseViewCtrl.h"
#import "Masonry.h"

@interface HJBaseViewCtrl ()

@end

@implementation HJBaseViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    backBtn.layer.borderColor = [UIColor redColor].CGColor;
    backBtn.layer.borderWidth = 2;
    backBtn.layer.cornerRadius = 5;
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    
    //布局
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-10));
        make.centerX.equalTo(self.view);
        make.height.equalTo(@(20));
        make.width.equalTo(@(50));
    }];
    
    //返回事件
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 返回按钮点击事件
-(void)backBtnAction:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - 创建单个视图
-(UIView *)createViewWithColor:(UIColor *)color
{
    UIView *view = UIView.new;
    view.backgroundColor = color;
    [self.view addSubview:view];
    
    return view;
}

#pragma mark - 创建多个视图
-(NSMutableArray *)createSomeViewsWithCount:(NSInteger)count color:(UIColor *)color
{
    NSMutableArray *viewArr = NSMutableArray.new;
    for ( int i = 0; i < count; i++) {
        UIView *view = [self createViewWithColor:color];
        [viewArr addObject:view];
        [self.view addSubview:view];
    }
    return viewArr;
}



#pragma mark - 隐藏系统状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
