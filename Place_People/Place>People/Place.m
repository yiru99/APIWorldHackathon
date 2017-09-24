//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Parse/PFObject.h>
#import "Place.h"

@implementation Place
- (id)initWithPFObject:(PFObject *)json {
    self = [super init];
    if (self) {
        self.objectId = json[@"objectId"];
        self.name = json[@"name"];
        self.geofenceLocation = json[@"geofenceLocation"];
    }
    return self;
}
@end