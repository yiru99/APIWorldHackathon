//
// Created by Yiru Yao on 9/24/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFObject;


@interface User : NSObject
@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *imageUrl;

- (id)initWithPFObject:(PFObject *)json;
@end