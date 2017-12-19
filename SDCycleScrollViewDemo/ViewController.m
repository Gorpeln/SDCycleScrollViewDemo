//
//  ViewController.m
//  SDCycleScrollViewDemo
//
//  Created by chen on 16/6/10.
//  Copyright © 2016年 Gorpeln. All rights reserved.
//

/*********************************************************
 *  gitHub  :  https://github.com/GorpelnChen            *
 *********************************************************/

#import "ViewController.h"
#import "SDCycleScrollView.h"

@interface ViewController ()<SDCycleScrollViewDelegate>

@property(nonatomic, strong) SDCycleScrollView *cycleScrollView;//轮播图


@end

@implementation ViewController

@synthesize cycleScrollView;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self loadHeaderScrollView];
    self.title = @"轮播Demo";
    
}

-(void)loadHeaderScrollView{
    
    
    CGFloat headerScrollViewWidth = self.view.bounds.size.width;
    CGFloat headerScrollViewHeight = self.view.bounds.size.height;
    //轮播图片
    NSArray *imageArray = [NSArray arrayWithObjects:
                           @"http://pic38.nipic.com/20140228/5571398_215900721128_2.jpg",
                           @"http://pic31.nipic.com/20130708/12246968_161410243000_2.jpg",
                           @"http://img3.3lian.com/2013/s1/20/d/56.jpg",
                           @"http://pic1.nipic.com/2008-12-25/2008122510134038_2.jpg",
                           nil];
    //轮播标题
    NSArray *titleArray = [NSArray arrayWithObjects:@"这是第1张图片",@"这是第2张图片",@"这是第3张图片",@"这是第4张图片",nil];
    
    
    
    //如果轮播图已经初始化就不再alloc
    if (!cycleScrollView)cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,headerScrollViewWidth,headerScrollViewHeight /4) imageURLStringsGroup:imageArray]; // 模拟网络延时情景
    
    cycleScrollView.titlesGroup = titleArray;//标题数组  如果需要显示的话 不显示  注释掉本句就可以
    //    cycleScrollView.titleLabelTextColor=[UIColor redColor];//轮播文字label字体颜色
    //    cycleScrollView.titleLabelTextFont=[UIFont systemFontOfSize:13.0];//轮播文字label字体大小
    //    cycleScrollView.titleLabelBackgroundColor=[UIColor cyanColor];//轮播文字label背景颜色
    //    cycleScrollView.titleLabelHeight=25.0;//轮播文字label高度
    cycleScrollView.delegate = self;//代理方法
    
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;//小圆点的位置
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;//转动方向 水平 垂直
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;// 小圆点的样式
    cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    //    cycleScrollView.pageControlDotSize=CGSizeMake(5.0, 5.0);// 自定义分页控件小圆标 大小
    //    // 自定义分页控件小圆标  图片
    //    cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    //    cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    cycleScrollView.showPageControl = YES;// 是否显示pagecontrol 小圆点
    cycleScrollView.autoScrollTimeInterval = 5;// 轮播图自动轮播的时间间隔  秒
    cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];//默认图
    [self.view addSubview:cycleScrollView];
    
    //模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView.imageURLStringsGroup = imageArray;
    });
    
    
}

#pragma mark - SDCycleScrollViewDelegate轮播图代理点击代理方法
//点击轮播图   进入对应的界面  index是下标
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    NSLog(@"第%d张轮播图",(int)index);
    
}



@end
