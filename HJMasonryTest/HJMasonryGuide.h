//
//  HJMasonryGuide.h
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//



1.equalTo 和 mas_equalTo:
    (1)equalTo: 没有自动包装功能, 传入的参数必须是对象
    (2)mas_equalTo, 用法和功能跟equalTo一样,但拥有自动包装功能, 可以将传入的基本数据类型,和结构体,自动帮我们包装成NSNumber和NSValue对象
    (3)如果想要使用equalTo时,也能自动将基本数据类型包装成对象, 需要在导入Masonry.h之前,先定义这个宏:
            #define MAS_SHORTHAND_GLOBALS

2.获取布局属性:
    (1)view.mas_top: 一个视图要获取由Masonry定义的布局属性时, 默认要加上mas_前缀
    (2)view.top: 如果你不想使用mas_前缀, 就能直接获取Masonry定义的布局属性, 需要在导入Masonry.h之前,先定义这个宏:
            #define MAS_SHORTHAND

3.如果是在自己封装的继承自UIView的视图内部使用自动布局, 要实现这个方法:
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

