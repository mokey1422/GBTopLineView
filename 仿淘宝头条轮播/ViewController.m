//
//  ViewController.m
//  仿淘宝头条轮播
//
//  Created by 张国兵 on 15/8/28.
//  Copyright (c) 2015年 zhangguobing. All rights reserved.

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define kMidViewWidth   250
#define kMidViewHeight  50

#import "GBTopLineViewModel.h"
#import "GBTopLineView.h"
#import "ViewController.h"
@interface ViewController (){
    

}
@property(nonatomic,strong)NSMutableArray*dataArr;
@property (nonatomic,strong) GBTopLineView *TopLineView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr=[[NSMutableArray alloc]init];
    self.view.backgroundColor =[UIColor lightGrayColor];
    [self createTopLineView];
    [self getData];

}
#pragma mark-创建头条视图
-(void)createTopLineView{
    
    _TopLineView = [[GBTopLineView alloc]initWithFrame:CGRectMake(0, 0, kMidViewWidth, kMidViewHeight)];
    _TopLineView.center = CGPointMake(ScreenWidth/2.0, ScreenHeight/2.0-150);
    _TopLineView.backgroundColor = [UIColor whiteColor];
    __weak __typeof(self)weakSelf = self;
    _TopLineView.clickBlock = ^(NSInteger index){
        GBTopLineViewModel *model = weakSelf.dataArr[index];
        NSLog(@"%@,%@",model.type,model.title);
    };
    [self.view addSubview:_TopLineView];

}
#pragma mark-获取数据
- (void)getData
{
    NSArray *arr1 = @[@"最新",@"最热",@"推荐",@"关注",@"反馈"];
    NSArray *arr2 = @[@"66万硬币买车",@"泰坦尼克号重建",@"小德法网首胜纳达尔",@"欢迎大家来关注我的github主页",@"开发群qq：433060483"];
    for (int i=0; i<arr2.count; i++) {
        GBTopLineViewModel *model = [[GBTopLineViewModel alloc]init];
        model.type = arr1[i];
        model.title = arr2[i];
        [_dataArr addObject:model];
    }
    [_TopLineView setVerticalShowDataArr:_dataArr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
