//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFObject;

@interface Post : NSObject
@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSString *placeId;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) NSString *imageUrl;
@property (nonatomic, retain) NSNumber *likes;

- (id)initWithPFObject:(PFObject *)json;
@end