//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import "Post.h"
#import "../../../../Library/Caches/AppCode2017.2/DerivedData/Place>People-ebrkaniohbgsmaeoegyvqbsbheej/Build/Products/Debug-iphoneos/Parse/Parse.framework/Headers/PFObject.h"


@implementation Post
- (id)initWithPFObject:(PFObject *)json {
    self = [super init];
    if (self) {
        self.objectId = json[@"objectId"];
        self.placeId = json[@"placeId"];
        self.imageUrl = json[@"imageUrl"];
        self.createdAt = json[@"createdAt"];
        self.likes = json[@"likes"];
        self.content = json[@"content"];
        self.userId = json[@"userId"];
    }
    return self;
}
@end