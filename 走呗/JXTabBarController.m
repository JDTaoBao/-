//
//  JXTabBarController.m
//  走呗
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 JIUXIAO. All rights reserved.
//

#import "JXTabBarController.h"
#import "JXTabBarButton.h"
#import "JXTabBar.h"

@interface JXTabBarController () <JXTabBarDelegate>

@end

@implementation JXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //删除现有的tabBar
    CGRect rect = self.tabBar.bounds; //这里要用bounds来加, 否则会加到下面去.看不见
//    LogFrame(self.tabBar);
    //[self.tabBar removeFromSuperview];  //移除TabBarController自带的下部的条
    
    //测试添加自己的视图
    JXTabBar *myView = [[JXTabBar alloc] init]; //设置代理必须改掉前面的类型,不能用UIView
    myView.backgroundColor = [UIColor colorWithRed:3 / 255.0 green:3 / 255.0 blue:3 / 255.0 alpha:1];
    myView.delegate = self; //设置代理
    myView.frame = rect;
    [self.tabBar addSubview:myView]; //添加到系统自带的tabBar上, 这样可以用的的事件方法. 而不必自己去写
    
    //为控制器添加按钮
    for (int i = 0; i < self.viewControllers.count; i++) { //根据有多少个子视图控制器来进行添加按钮
        NSLog(@"laile");
        NSString *imageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *imageNameSel = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        UIImage *image = [UIImage imageNamed:imageName];
        UIImage *imageSel = [UIImage imageNamed:imageNameSel];
        
        [myView addButtonWithImage:image selectedImage:imageSel];
    }
    
}

/**永远别忘记设置代理*/
- (void)tabBar:(JXTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to {
    self.selectedIndex = to;
}


@end

