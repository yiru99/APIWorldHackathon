//
//  MapViewController.m
//  Place>People
//
//  Created by kelvin on 23/9/17.
//  Copyright © 2017 APIWorldHackathon. All rights reserved.
//

#import "MapViewController.h"
@import HyperTrack;


@interface MapViewController() <HTViewCustomizationDelegate, HTViewInteractionDelegate, HTEventsDelegate>
@property (weak, nonatomic) IBOutlet UIView *hyperTrackView;

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
    
    [map embedIn:self.view];
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
