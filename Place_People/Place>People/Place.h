//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFObject;

@interface Place : NSObject
@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSString *geofenceLocation;
@property (strong, nonatomic) NSString *name;

- (id)initWithPFObject:(PFObject *)json;
@end