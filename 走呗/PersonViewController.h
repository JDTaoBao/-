//
//  PersonViewController.h
//  走呗
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 JX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)Posts:(id)sender;
- (IBAction)Attention:(id)sender;
- (IBAction)Avatar:(id)sender;
- (IBAction)Fans:(id)sender;
- (IBAction)Praise:(id)sender;
@property(nonatomic,retain)UITableView *tableView;
@end
