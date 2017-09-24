//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import "MainController.h"
#import "User.h"
#import "Post.h"
#import "Place.h"
@import Parse;



@implementation MainController

- (void)loadData {
//    PFQuery *userQuery = [PFUser query];
    PFQuery *postQuery = [PFQuery queryWithClassName:@"Post"];
//    PFQuery *placeQuery = [PFQuery queryWithClassName:@"Place"];
    NSMutableArray *posts = [NSMutableArray array];
//    NSMutableDictionary *users = [NSMutableDictionary dictionary];
//    NSMutableDictionary *places = [NSMutableDictionary dictionary];
//    [userQuery findObjectsInBackgroundWithBlock:^(NSArray *allUsers, NSError *error) {
//        for (PFObject *pfObject in allUsers) {
//            User *user = [[User alloc] initWithPFObject:pfObject];
//            users[user.username] = user;
//        }
//        NSDictionary* userInfo = @{@"users": users};
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"usersDataChanged"
//                                                            object:self
//                                                          userInfo:userInfo];
//    }];
    // TODO: calcualte the effective places as a filter
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray *allPosts, NSError *error) {
        for (PFObject *pfObject in allPosts) {
            Post *post = [[Post alloc] initWithPFObject:pfObject];
            [posts addObject:post];
        }
        NSDictionary* userInfo = @{@"posts": posts};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"postsDataChanged"
                                                            object:self
                                                          userInfo:userInfo];
    }];
//    [placeQuery findObjectsInBackgroundWithBlock:^(NSArray *allPlaces, NSError *error) {
//        for (PFObject *pfObject in allPlaces) {
//            Place *place = [[Place alloc] initWithPFObject:pfObject];
//            places[place.name] = place;
//        }
//        NSDictionary* userInfo = @{@"places": places};
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"placesDataChanged"
//                                                            object:self
//                                                          userInfo:userInfo];
//    }];


    // The InBackground methods are asynchronous, so any code after this will run
    // immediately.  Any code that depends on the query result should be moved
    // inside the completion block above.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:TRUE];
    [self loadData];
//    self.navigationItem.hidesBackButton = YES;
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:45/255.0 green:50/255.0 blue:79/255.0 alpha:1.0];
//    self.navigationController.navigationBar.translucent = NO;
//    self.title = @"Test";
}
@end
