//
//  PersonViewController.m
//  走呗
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 JX. All rights reserved.
//

#import "PersonViewController.h"
#import "PostsViewController.h"
#import "PraiseViewController.h"
#import "FansViewController.h"
#import "AttentionViewController.h"
#import "AvatarViewController.h"
#import "AppDetailViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController
//个人页面
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.navigationController.navigationBarHidden=YES;
//       self.title=@"个人页面";
    self.navigationItem.title=@"个人页面";
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 188, self.view.frame.size.width, self.view.frame.size.height)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
   [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=@"走呗";
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppDetailViewController *appVC = [[AppDetailViewController alloc] init];
    
    [self.navigationController pushViewController:appVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)Posts:(id)sender {
    PostsViewController *PostsVC=[[PostsViewController alloc]init];
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"我的" style:UIBarButtonItemStylePlain target:nil action:nil];

    
    [self.navigationController pushViewController:PostsVC animated:YES];
    
    
}

- (IBAction)Attention:(id)sender {
    
    
}

- (IBAction)Avatar:(id)sender {
    
}

- (IBAction)Fans:(id)sender {
    FansViewController *FansVC=[[FansViewController alloc]init];
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"哈哈" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationController pushViewController:FansVC animated:YES];
    
}

- (IBAction)Praise:(id)sender {
    
}
@end
