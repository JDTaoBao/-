//
//  JXTabBar.m
//  走呗
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 JIUXIAO. All rights reserved.
//

#import "JXTabBar.h"
#import "JXTabBarButton.h"
#import "Constants.h"

#define TabBarWidth (self.bounds.size.width - 136) / 10

@interface JXTabBar ()
/**
 *  设置之前选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, weak) NSArray  *array;
@property (nonatomic, strong) UIView   *popView;

@end

@implementation JXTabBar
/**
 *  在这个方法里写控件初始化的东西, 调用init方法时会调用
 */
- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
        
		//添加按钮
		for (int i = 0; i < 5; i++) { //取消掉特定的数字
			//UIButton *btn = [[UIButton alloc] init];
			JXTabBarButton *btn = [[JXTabBarButton alloc] init];

			NSString *imageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
			NSString *imageNameSel = [NSString stringWithFormat:@"TabBar%dSel", i + 1];

			[btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
			[btn setImage:[UIImage imageNamed:imageNameSel] forState:UIControlStateSelected];

			[self addSubview:btn];

			btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图

			//带参数的监听方法记得加"冒号"
			[btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];

			if (0 == i) {
				[self clickBtn:btn];
			}
		}
        [self configPopView];
	}
	return self;
}

- (void)configPopView
{
    UIScreen *s=[UIScreen mainScreen];
    CGFloat wid=[s bounds].size.width;
    CGFloat height=[s bounds].size.height;
    //点击中间的按钮弹出一个视图,是自定义的
    self.popView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.popView.backgroundColor = [UIColor whiteColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    [label setText:@"弹出视图!"];
    [label setTextColor:[UIColor blackColor]];
    [self.popView addSubview:label];
    
    //底部的关闭按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, height-48, wid, 48);
    [button setImage:[UIImage imageNamed:@"5"] forState:UIControlStateNormal];
    button.backgroundColor=[UIColor lightGrayColor];
    [button addTarget:self action:@selector(closePopView) forControlEvents:UIControlEventTouchUpInside];
    [self.popView addSubview:button];
    
}

- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    UIButton *btn = [[UIButton alloc] init];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    
    [self addSubview:btn];
    
    //带参数的监听方法记得加"冒号"
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //如果是第一个按钮, 则选中(按顺序一个个添加)
    if (self.subviews.count == 1) {
        [self clickBtn:btn];
    }
}

/**专门用来布局子视图, 别忘了调用super方法*/
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.array = [NSArray arrayWithObjects:@"动态", @"约伴", @"发布", @"发现", @"我的", nil];
    
    int count = (int)self.subviews.count;
    for (int i = 0; i < count; i++) {
        //取得按钮
        
        if (i < 2) {
            UIButton *btn = self.subviews[i];
            
            btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
            
            CGFloat x = ((i + 1) * 2 - 1) * TabBarWidth + 25 * i;
            CGFloat y = 8;
            CGFloat width = 25;
            CGFloat height = 25;
            btn.frame = CGRectMake(x, y, width, height);
        } else if (i == 2) {
            UIButton *btn = self.subviews[i];
            
            btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
            
            CGFloat x = ((i + 1) * 2 - 1) * TabBarWidth + 50;
            CGFloat y = 4;
            CGFloat width = 36;
            CGFloat height = 36;
            btn.frame = CGRectMake(x, y, width, height);
        } else {
            UIButton *btn = self.subviews[i];
            
            btn.tag = i; //设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
            
            CGFloat x = ((i + 1) * 2 - 1) * TabBarWidth + 25 * (i - 1) + 36;
            CGFloat y = 8;
            CGFloat width = 25;
            CGFloat height = 30;
            btn.frame = CGRectMake(x, y, width, height);
        }
        
    }
}

/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickBtn:(UIButton *)button {
    
    if (button.tag == 2) {
        [UIView animateWithDuration:0.5 animations:^{
            [self addSubview:self.popView];//可以自定义一些控件加上动画的效果
        }];
    } else {
        
        //1.先将之前选中的按钮设置为未选中
        self.selectedBtn.selected = NO;
        //2.再将当前按钮设置为选中
        button.selected = YES;
        //3.最后把当前按钮赋值为之前选中的按钮
        self.selectedBtn = button;
        
        //却换视图控制器的事情,应该交给controller来做
        //最好这样写, 先判断该代理方法是否实现
        if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
            [self.delegate tabBar:self selectedFrom:self.selectedBtn.tag to:button.tag];
        }
        
        //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
        //self.selectedIndex = button.tag;
    }
}

#pragma mark - 点击弹出的视图上的关闭按钮
- (void)closePopView {
    //1.移除当前遮盖视图
    [self.popView removeFromSuperview];
    
}

@end
