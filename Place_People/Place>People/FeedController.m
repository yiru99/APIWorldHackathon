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

- (id)init {
    self = [super init];
    [self loadData];
    return self;
}

- (void)loadData {
    PFQuery *userQuery = [PFQuery queryWithClassName:@"User"];
    PFQuery *postQuery = [PFQuery queryWithClassName:@"Post"];
    PFQuery *placeQuery = [PFQuery queryWithClassName:@"Place"];
    [userQuery findObjectsInBackgroundWithBlock:^(NSArray *allUsers, NSError *error) {
        for (PFObject *pfObject in allUsers) {
            User *user = [[User alloc] initWithPFObject:pfObject];
            self.users[user.objectId] = user;
        }
    }];
    // TODO: calcualte the effective places as a filter
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray *allPosts, NSError *error) {
        for (PFObject *pfObject in allPosts) {
            Post *post = [[Post alloc] initWithPFObject:pfObject];
            [self.posts addObject:post];
        }
    }];
    [placeQuery findObjectsInBackgroundWithBlock:^(NSArray *allPlaces, NSError *error) {
        for (PFObject *pfObject in allPlaces) {
            Place *place = [[Place alloc] initWithPFObject:pfObject];
            self.places[place.objectId] = place;
        }
    }];


    // The InBackground methods are asynchronous, so any code after this will run
    // immediately.  Any code that depends on the query result should be moved
    // inside the completion block above.
}

@end