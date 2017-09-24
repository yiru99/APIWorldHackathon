//
// Created by Yiru Yao on 9/23/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface FeedController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *posts;
@property (nonatomic, retain) NSMutableDictionary *users;
@property (nonatomic, retain) NSMutableDictionary *places;
@end
