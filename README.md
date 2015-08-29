# GBTopLineView
#仿淘宝头条<br>
##淘宝大家肯定都在用吧，首页部分的头条的那个竖直的轮播大家还记得吧，现在项目里有需求所以就就封装了一下只暴露一个接口给你们用省时间<br>
###如果觉得有用的话请点个星谢谢支持，会继续出一些功能性的框架，如有bug也请指出群号：433060483欢迎加入组织<br>
###特此在这里感谢一下我的同事[张世超](https://github.com/ZSC1989)大家可以去他的主页去踩踩点击名字就可以去了专机接送 O(∩_∩)O哈哈~<br>
#使用说明:<br>
* 直接把文件包拖入到项目里面在使用的地方包含一下头文件<br>
* 看一下实例代码：<br>
```
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

```
##特别说明一下:<br>
### * 支持长按手势停留主题界面手势结束的时候恢复轮播<br>
#效果图展示：<br>
##效果图动画不是很流畅，但是不要担心demo跑起来最少在40帧以上动画完全不是gif图那样绝对流畅放心使用<br>
![image](https://github.com/mokey1422/gifResourceOther/blob/master/GBTopLineViewGif.gif)
