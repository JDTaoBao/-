//
//  AppointmentViewController.m
//  走呗
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 JIUXIAO. All rights reserved.
//

#import "AppointmentViewController.h"
#import "Constants.h"
#import "HMSegmentedControl.h"
#import "AppDetailViewController.h"

@interface AppointmentViewController () <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@property (nonatomic, strong)UITableView  *hotTableView;
@property (nonatomic, strong)UITableView  *personTableView;
@property (nonatomic, strong)UITableView  *comeTableView;
@property (nonatomic, strong)UITableView  *goTableView;

@end

@implementation AppointmentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"约伴";
    
    // Tying up the segmented control to a scroll view
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, viewWidth, 35)];
    self.segmentedControl.sectionTitles = @[@"热门约伴", @"约伴的人", @"附近出发", @"来附近"];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : RGBCOLOR(107, 213, 252, 1)};
    self.segmentedControl.selectionIndicatorColor = RGBCOLOR(107, 213, 252, 1);
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 3;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(viewWidth * index, 0, viewWidth, 200) animated:YES];
    }];
    
    [self.view addSubview:self.segmentedControl];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 99, viewWidth, self.view.frame.size.height - 99)];
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(viewWidth * 4, self.view.frame.size.height - 99);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, viewWidth, 200) animated:NO];
    [self.view addSubview:self.scrollView];
    
    self.hotTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FrameSizeWidth, FrameSizeHeight) style:UITableViewStylePlain];
    _hotTableView.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:_hotTableView];
    
    self.personTableView = [[UITableView alloc] initWithFrame:CGRectMake(FrameSizeWidth, 0, FrameSizeWidth, FrameSizeHeight) style:UITableViewStylePlain];
    _personTableView.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:_personTableView];
    
    self.comeTableView = [[UITableView alloc] initWithFrame:CGRectMake(FrameSizeWidth * 2, 0, FrameSizeWidth, FrameSizeHeight) style:UITableViewStylePlain];
    _comeTableView.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:_comeTableView];
    
    self.goTableView = [[UITableView alloc] initWithFrame:CGRectMake(FrameSizeWidth * 3, 0, FrameSizeWidth, FrameSizeHeight) style:UITableViewStylePlain];
    _goTableView.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:_goTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppDetailViewController *appDeVC = [[AppDetailViewController alloc] init];
    
    [self.navigationController pushViewController:appDeVC animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
