//
//  HJPriorityVC.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "HJPriorityVC.h"
#import "Masonry.h"

@interface HJPriorityVC ()

@end

@implementation HJPriorityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testPriority];
}


#pragma mark - 优先级 priority
-(void)testPriority
{
    UIView *orangeView = [self createViewWithColor:UIColor.orangeColor];
    
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //一.通过设置优先级来解决多个约束之间的冲突
        //1.种类:
        //priorityLow(),    低
        //priorityHigh(),   高
        //priorityMedium(), 中
        //priority(0.8),    自定义优先级
        //2.规则:
        //有冲突时,忽略低优先级的约束
        //3.使用:
        //优先级设置放在约束链的最后面
        
        
        //二.要求:
        //1.顶部和左边跟父视图重合
        //2.高度 = self.view的高 * 0.5
        //3.宽度 = self.view的宽 - 20
        
        //三.添加约束
        //1.顶部,左边
        make.top.left.equalTo(@(0));
        //2.高度
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
        //3.size
        make.size.equalTo(self.view).sizeOffset(CGSizeMake(-20, 0)).priorityLow();
        
        //四.说明:
        //在第2步中设置了高度约束
        //在第3步中设置size时, 也设置了高度约束,跟第2步产生了冲突
        //需求是保留第2步中的高度约束, 所以在第3步的约束链末尾加上低优先级priorityLow(),
        
        
        //按道理这么设置也可以:
#if 0   //但不是预想的效果,同时也不报错,估计是Masonry的bug 😅😅
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5).priorityHigh();
        make.size.equalTo(self.view).sizeOffset(CGSizeMake(-20, 0));
#endif
        
    }];
}


@end
