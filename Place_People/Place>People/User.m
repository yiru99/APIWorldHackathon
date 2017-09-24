//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Parse/PFObject.h>
#import "User.h"

@implementation User
- (id)initWithPFObject:(PFObject *)json {
    self = [super init];
    if (self) {
//        self.objectId = json[@"objectId"];
        self.username = json[@"username"];
//        self.imageUrl = json[@"imageUrl"];
    }
    return self;
}

@end