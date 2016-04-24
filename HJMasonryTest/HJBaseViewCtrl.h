//
//  HJBaseViewCtrl.h
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJBaseViewCtrl : UIViewController

/**
 *  创建单个视图
 *
 *  @param color 指定背景色
 *
 *  @return 视图
 */
-(UIView *)createViewWithColor:(UIColor *)color;


/**
 *  创建多个视图
 *
 *  @param count 个数
 *  @param color 背景色
 *
 *  @return 数组存放视图
 */

-(NSMutableArray *)createSomeViewsWithCount:(NSInteger)count color:(UIColor *)color;

@end
