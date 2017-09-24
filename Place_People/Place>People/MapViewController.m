//
//  MapViewController.m
//  Place>People
//
//  Created by kelvin on 23/9/17.
//  Copyright © 2017 APIWorldHackathon. All rights reserved.
//

#import "MapViewController.h"
@import HyperTrack;
@import CoreLocation;


@interface MapViewController() <HTViewCustomizationDelegate, HTViewInteractionDelegate, HTEventsDelegate>
@property (weak, nonatomic) IBOutlet UIView *hyperTrackView;
@property (weak, nonatomic) IBOutlet UIView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Instantiate HyperTrack map view and embed this in your view
    HTMap * map = [HyperTrack map];
    
    // Configure view interaction delegate in HyperTrack map
    [map setHTViewInteractionDelegateWithInteractionDelegate:self];
    
    // Configure view customization delegate in HyperTrack map
    [map setHTViewCustomizationDelegateWithCustomizationDelegate:self];
    
    // Configure events delegate in HyperTrack map
    [HyperTrack setEventsDelegateWithEventDelegate:self];
    
//    [HyperTrack trackActionForActionID:@"24b3b8ac-bacd-4270-b72a-9cc13d02531b" completionHandler:^(HyperTrackAction *  action , HyperTrackError * error) {
//        if (error != nil) {
//            // Handle trackActionForActionID API error here
//            NSLog(@"Error in trackOrder: %@", error.debugDescription);
//        } else {
//            // Handle trackActionForActionID API success here
//            NSLog(@"trackAction for Action ID successful");
//        }
//    }];
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefaults stringForKey:@"current_username"];
    
    [HyperTrack getOrCreateUser:username _phone:@"" :username
              completionHandler:^(HyperTrackUser * _Nullable htuser,
                                  HyperTrackError * _Nullable error) {
                  if (htuser) {
                      // Handle createUser success here, if required
                      // HyperTrack SDK auto-configures UserId on createUser API call,
                      // so no need to call [HyperTrack setUserId:@"USER_ID"] API
                      
                      // Handle createUser API success here
                      NSLog(@"%@", htuser);
                      
                      HTMockLocationParams *locationParams = [[HTMockLocationParams alloc] initWithDestination:CLLocationCoordinate2DMake(28.41, 77.12 )];
                      [HyperTrack startMockTrackingWithParams:locationParams];
                  } else {
                      // Handle createUser error here, if required
                      NSLog(@"%@", error.debugDescription);
                  }
              }];
    
    [map embedIn:self.mapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
