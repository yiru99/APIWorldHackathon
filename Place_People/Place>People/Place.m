//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import "Place.h"
#import "../../../../Library/Caches/AppCode2017.2/DerivedData/Place>People-ebrkaniohbgsmaeoegyvqbsbheej/Build/Products/Debug-iphoneos/Parse/Parse.framework/Headers/PFObject.h"


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