//
//  HJOffsetVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJOffsetVC.h"
#import "Masonry.h"

@interface HJOffsetVC ()

@end


#if 0
    
offset:
    设置top,left,bottom,right的偏移,
    传入的参数是CGFloat类型,
    向下和向右为正,
    向上和向左为负,
    
insets:
    同时设置top,left,bottom,right的内边距,
    传入的参数是UIEdgeInsets类型, 顺序是上左下右
    在另一个视图之内为正, 之外为负
    
中心点偏移:
    向下和向右为正,
    向上和向左为负,
    
#endif

@implementation HJOffsetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testOffset];
    
    [self testInsets];
    
    [self testCenterOffset];
}



#pragma mark - 偏移
-(void)testOffset
{
    UIView *purpleView = [self createViewWithColor:[UIColor purpleColor]];
    
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        //顶部距self.view的顶部为10
        make.top.equalTo(self.view.mas_top).offset(10);
        
        //左边距self.view的左边为20
        make.left.equalTo(self.view).offset(20);
        
        //高度,宽度都等于100
        make.height.width.equalTo(@(100));
        
    }];
}

#pragma mark - 内边距
-(void)testInsets
{
    UIView *greenView = [self createViewWithColor:[UIColor greenColor]];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        //1.通过top,left,bottom,right设置内边距, 会自动去匹配UIEdgeInsets中对应的值:
        make.top.right.equalTo(self.view).insets(UIEdgeInsetsMake(10, 999, 999, 10));  //只设置上,右都为10
        make.left.equalTo(self.view).insets(UIEdgeInsetsMake(999, 200, 999, 999));     //只设置左为200
        make.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(999, 999, 10, 999));    //只设置下为10
        
        
        //2.通过edges同时设置4个内边距:
#if 0   //上左下右跟self.view的内边距分别为:10, 200, 10, 20, 效果跟上面一样
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 200, 10, 10));
#endif
        
    }];
}


#pragma mark - 中心点偏移
-(void)testCenterOffset
{
    UIView *blackView = [self createViewWithColor:[UIColor blackColor]];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.equalTo(@(100));
        
        
        //要求:
        //中心点x = self.view的中心点x 向左偏移60
        //中心点y = self.view的中心点y 向下偏移60
        
        
        
#if 1   //第1种方法:
        make.centerX.equalTo(self.view).offset(-60);
        make.centerY.equalTo(self.view).offset(60);
#endif
        
        
#if 0   //第2种方法:
        make.center.equalTo(self.view).centerOffset(CGPointMake(-60, 60));
#endif
        
#if 0   //第3种方法:
        make.center.equalTo(self.view).offset(60);//只能设置中心点x,y相同的偏移量
#endif
        
        
    }];
    
    
    {
        //显示中心点
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
        view1.center = self.view.center;
        view1.backgroundColor = [UIColor redColor];
        [self.view addSubview:view1];
        view1.layer.cornerRadius = 2.5;
        
        UIView *view2 = [[UIView alloc] init];
        view2.backgroundColor = [UIColor redColor];
        [blackView addSubview:view2];
        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(blackView);
            make.width.height.equalTo(@(5));
        }];
        view2.layer.cornerRadius = 2.5;
    }
}



@end
