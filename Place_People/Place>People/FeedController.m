//
// Created by Yiru Yao on 9/23/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import "FeedController.h"
#import "User.h"
#import "Post.h"
#import "Place.h"
@import Parse;


@implementation FeedController

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleUsersNotification:)
                                                 name:@"usersDataChanged"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handlePlacesNotification:)
                                                 name:@"placesDataChanged"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handlePostsNotification:)
                                                 name:@"postsDataChanged"
                                               object:nil];
    return;
}
- (id)init {
    self = [super init];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleUsersNotification:)
                                                 name:@"usersDataChanged"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handlePlacesNotification:)
                                                 name:@"placesDataChanged"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handlePostsNotification:)
                                                 name:@"postsDataChanged"
                                               object:nil];
    return self;
}

- (void)handleUsersNotification:(id)object {
    self.users = object;
    if (self.places && self.posts)
        [self.tableView reloadData];
}

- (void)handlePlacesNotification:(id)object {
    self.places = object;
    if (self.posts && self.users)
        [self.tableView reloadData];
}

- (void)handlePostsNotification:(id)object {
    self.posts = object;
    if (self.users && self.places)
        [self.tableView reloadData];
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts ? self.posts.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)likeApost {

}

- (void)commentApost {

}

@end
