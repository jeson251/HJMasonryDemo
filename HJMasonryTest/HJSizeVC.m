//
//  HJSizeVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJSizeVC.h"
#import "Masonry.h"

@interface HJSizeVC ()

@end

@implementation HJSizeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testSizeOffset];
    
    [self testMultipliedByAndDividedBy];
}


#pragma mark - sizeOffset, 不是偏移, 是宽高的差值
-(void)testSizeOffset
{
    UIView *blackView = [self createViewWithColor:UIColor.blackColor];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.equalTo(@(0));
        
        //要求:
        //宽 = self.view的宽 - 200
        //高 = self.view的高 - 100
        
#if 1   //第1种方法:
        make.width.equalTo(self.view.mas_width).offset(-200);
        make.height.equalTo(self.view).offset(-100);
#endif
        
        
#if 0   //第2种方法:
        make.size.equalTo(self.view).sizeOffset(CGSizeMake(-200, -100));
#endif
        
#if 0   //第3种方法:
        make.size.equalTo(self.view).offset(-200); //只能将宽高设为相同值
#endif
        
    }];
}



#pragma mark - 倍数: multipliedBy乘, dividedBy除
-(void)testMultipliedByAndDividedBy
{
    UIView *yellowView = [self createViewWithColor:UIColor.yellowColor];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.right.equalTo(@(0));
        
        //要求:
        //宽 = self.view的宽 * 0.5
        //高 = self.view的高 / 3
        
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view.mas_height).dividedBy(3.0f);
        
        //!!!设置倍数时,最好传入一个属性width/height,不要传视图UIView, 传视图有时候会崩掉!!!
        
        
#if 0
        //都剩以0.5:
        make.size.equalTo(self.view).multipliedBy(0.5);
        //都除以3
        make.size.equalTo(self.view).dividedBy(3.0f);
#endif
    }];
}

@end
