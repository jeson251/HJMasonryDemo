//
//  HJAnimationVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJAnimationVC.h"
#import "Masonry.h"

@interface HJAnimationVC ()
//保存约束对象
@property(nonatomic,strong)NSMutableArray *constraintArr;

@end

@implementation HJAnimationVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testAnimation];
    
}


#pragma mark - 动画
-(void)testAnimation
{
    self.constraintArr = @[].mutableCopy;
    
    UIView *view1 = [self createViewWithColor:[UIColor redColor]];
    UIView *view2 = [self createViewWithColor:[UIColor greenColor]];
    UIView *view3 = [self createViewWithColor:[UIColor blackColor]];
    
    //view1
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //创建上,右,下的边距约束,并将约束对象保存到数组中
        MASConstraint *topConstraint = make.top.left.equalTo(@(20));
        [self.constraintArr addObject:topConstraint];
        
        [self.constraintArr addObject:make.right.equalTo(view2.mas_left).offset(-20)];
        [self.constraintArr addObject:make.bottom.equalTo(view3.mas_top).offset(-20)];
        
        
        make.width.equalTo(view2);
        make.height.equalTo(@[view2, view3]);
    }];
    
    //view2
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //创建边距约束,并将约束对象保存到数组中
        [self.constraintArr addObject:make.top.equalTo(@(20))];
        [self.constraintArr addObject:make.right.equalTo(@(-20))];
        
    }];
    
    //view3
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //创建边距约束,并将约束对象保存到数组中
        [self.constraintArr addObject:make.left.equalTo(@(20))];
        [self.constraintArr addObject:make.bottom.right.equalTo(@(-20))];
        
    }];
    
    //开始动画
    //初始时,已经是最大尺寸, 传NO不放大
    [self beginAnimationWithEnlargeMark:NO];
    
}

#pragma mark - 开始动画
-(void)beginAnimationWithEnlargeMark:(BOOL)enlargeMark
{
    //1.修改边距
    //放大的时候边距为20
    //缩小的时候边距为100
    CGFloat edgeSpace = enlargeMark ? 20 : 100;
    
    //2.修改边距约束
    for (MASConstraint *constraint in self.constraintArr) {
        //修改之前保存的所有边距约束 的边距值
        constraint.insets = UIEdgeInsetsMake(edgeSpace, edgeSpace, edgeSpace, edgeSpace);
    }
    
    //3.执行动画
    [UIView animateWithDuration:1 animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        //4.重复执行,并将是否放大标志取反
        [self beginAnimationWithEnlargeMark:!enlargeMark];
    }];
}

@end
