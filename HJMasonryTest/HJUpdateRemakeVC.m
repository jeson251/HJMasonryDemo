//
//  HJUpdateRemakeVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJUpdateRemakeVC.h"
#import "Masonry.h"

@interface HJUpdateRemakeVC ()
@property(nonatomic,weak)UIView *testView;

@end

@implementation HJUpdateRemakeVC

#if 0

//每一条创建约束的语句就是一条约束链,有返回值
MASConstraint *constraint = make.top.equalTo(@(10));

//1.mas_make:
//会将布局属性创建的约束强制性添加
[testView mas_makeConstraints:^(MASConstraintMaker *make) {}];

//2.mas_update:
//如果一个布局属性之前已经添加了约束,那么本次创建的约束将会覆盖之前的.
//如果之前没有添加过约束,则直接添加,跟mas_make一样.
//一般用于,修改某个已经添加过的约束
[testView mas_updateConstraints:^(MASConstraintMaker *make) {}];


//3.mas_remake:
//会先将这个视图所有的布局属性,添加过的约束全部清空
//然后再添加本次创建的约束
//一般用于,重新设置视图的所有约束
[testView mas_remakeConstraints:^(MASConstraintMaker *make) {}];

#endif

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testMake];
    
    [self testUpdate];
    
    [self testRemake];
    
}


#pragma mark - mas_make
-(void)testMake
{
    
    UIButton *makeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    makeBtn.backgroundColor = [UIColor lightGrayColor];
    [makeBtn setTitle:@"点击make" forState:UIControlStateNormal];
    [self.view addSubview:makeBtn];
    
    [makeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(10));
        make.left.equalTo(@(10));
        make.width.height.equalTo(@(100));
    }];
    
    [makeBtn addTarget:self action:@selector(makeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
//点击makeBtn
-(void)makeBtnClick:(UIButton *)makeBtn
{
    [makeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //同一个布局属性,重复添加相同的约束不会报错
        make.top.equalTo(@(10));
        
        //约束冲突,报错
        make.height.equalTo(@(200));
        
        /*
         Unable to simultaneously satisfy constraints.
         Probably at least one of the constraints in the following list is one you don't want.
         Try this:
         (1) look at each constraint and try to figure out which you don't expect;
         (2) find the code that added the unwanted constraint or constraints and fix it.
         .....
         .....
         */
    }];
}





#pragma mark - mas_update
-(void)testUpdate
{
    UIButton *updateBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    updateBtn.backgroundColor = [UIColor lightGrayColor];
    [updateBtn setTitle:@"点击update" forState:UIControlStateNormal];
    [self.view addSubview:updateBtn];
    [updateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(10));
        make.right.equalTo(@(-10));
        make.width.height.equalTo(@(100));
    }];
    
    [updateBtn addTarget:self action:@selector(updateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
//点击updateBtn
-(void)updateBtnClick:(UIButton *)updateBtn
{
    [updateBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        //只修改宽和高
        make.width.equalTo(@(150));
        make.height.equalTo(@(200));
    }];
}





#pragma mark - mas_remake
-(void)testRemake
{
    UIButton *remakeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    remakeBtn.backgroundColor = [UIColor lightGrayColor];
    [remakeBtn setTitle:@"点击remake" forState:UIControlStateNormal];
    [self.view addSubview:remakeBtn];
    [remakeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-50));
        make.right.equalTo(@(-10));
        make.width.height.equalTo(@(100));
    }];
    
    [remakeBtn addTarget:self action:@selector(updateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
//点击remakeBtn
-(void)remakeBtnClick:(UIButton *)remakeBtn
{
    //清空原来的约束, 重新设置所有的约束
    [remakeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(@(-50));
        make.right.equalTo(@(-10));
        make.width.equalTo(@(180));
        make.height.equalTo(@(260));
    }];
}


@end
