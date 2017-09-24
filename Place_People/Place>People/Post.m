//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Parse/PFObject.h>
#import "Post.h"

@implementation Post
- (id)initWithPFObject:(PFObject *)json {
    self = [super init];
    if (self) {
        self.objectId = json.objectId;
        self.distance = json[@"distance"];
        self.imageUrl = json[@"imageUrl"];
        self.createdAt = json.createdAt;
        self.likes = json[@"likes"];
        self.content = json[@"content"];
        self.author = json[@"author"];
    }
    return self;
}
@end