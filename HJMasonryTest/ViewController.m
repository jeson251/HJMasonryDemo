//
//  ViewController.m
//  HJMasonryTest
//
//  Created by huangjiong on 16/4/23.
//  Copyright © 2016年 huangjiong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,weak)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *titleArr;
@property(nonatomic,strong)NSMutableArray *vcClassNameArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    
    self.vcClassNameArr = [NSMutableArray arrayWithObjects:
                     @"HJSimpleUsingVC",
                     @"HJOffsetVC",
                     @"HJSizeVC",
                     @"HJPriorityVC",
                     @"HJViewArrAddConstraintsVC",
                     @"HJEqualSpaceDistributeVC",
                     @"HJArrParameterVC",
                     @"HJAnimationVC",
                     @"HJUpdateRemakeVC",
                     nil];
    
    self.titleArr = [NSMutableArray arrayWithObjects:
                     @"简单使用equalTo",
                     @"偏移offset",
                     @"尺寸size",
                     @"优先级priority",
                     @"多个视图统一添加约束",
                     @"等间距排列多个视图",
                     @"将数组作为参数, 传给equalTo()",
                     @"动画",
                     @"make, update, remake",
                     nil];
    
    [self tableView];
}

-(UITableView *)tableView
{
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 25, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        //        [tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"Cell"];
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}

//点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcClassName = self.vcClassNameArr[indexPath.row];
    
    UIViewController *vc = [self createViewCtrlWithVcClassName:vcClassName];
    
    //跳转
    [self.navigationController pushViewController:vc animated:YES];
}


-(UIViewController *)createViewCtrlWithVcClassName:(NSString *)vcClassName
{
    Class vcClass = NSClassFromString(vcClassName);
    
    UIViewController *vc = vcClass.new;
    
    return vc;
}


//修改
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
