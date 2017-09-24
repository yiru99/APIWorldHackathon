//
//  NewPostController.m
//  Place>People
//
//  Created by Jia Wern Yong on 24/9/17.
//  Copyright © 2017 APIWorldHackathon. All rights reserved.
//

#import "NewPostController.h"
@import Parse;

@implementation NewPostController



- (IBAction)postBtn:(id)sender {
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        
        NSLog(@"User is currently at %f, %f", geoPoint.latitude, geoPoint.longitude);
        PFGeoPoint* userLocation = geoPoint;
//        [[PFUser currentUser] setObject:geoPoint forKey:@"currentLocation"];
//        [[PFUser currentUser] saveInBackground];
        
        NSLog(@"Button is clicked");
        NSString* input = _postText.text;
        PFObject *newPost = [PFObject objectWithClassName:@"Post"];
        newPost[@"imageUrl"] = @"https://static.pexels.com/photos/20787/pexels-photo.jpg";
        newPost[@"location"] = userLocation;
        newPost[@"content"] = input;
        newPost[@"likes"] = @0;
        [newPost saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // The object has been saved.
                NSLog(@"Object is saved");
            } else {
                // There was a problem, check error.description
                NSLog(@"%@", error.description);
            }
        }];
        
    }];
}

@end
