//
// Created by Yiru Yao on 9/23/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Parse/PFUser.h>
#import <UIKit/UIKit.h>
#import "LoginController.h"
#import "MainController.h"
#import "User.h"
@import HyperTrack;
#import <Parse/PFQuery.h>


@implementation LoginController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:TRUE];
    self.usernameField.placeholder = @"Username";
    self.passwordField.placeholder = @"Password";
}

- (IBAction)usernameChanged:(id)sender {
    self.username = self.usernameField.text;
}
- (IBAction)passwordChanged:(id)sender {
    self.password = self.passwordField.text;
}

- (IBAction)usernameDidEntered:(id)sender {
    self.username = self.usernameField.text;
}
- (IBAction)passwordDidEntered:(id)sender {
    self.password = self.passwordField.text;
}
- (IBAction)onLoginClicked:(id)sender {
    [PFUser logInWithUsernameInBackground:self.username password:self.password
                                    block:^(PFUser *pfuser, NSError *error) {
                                        if (pfuser) {
                                            // Get User details, if specified

                                            // Get or Create a User for given lookupId on HyperTrack Server here to login
                                            // your pfuser & configure HyperTrack SDK with this generated HyperTrack UserId.
                                            // OR
                                            // Implement your API call for User Login and get back a HyperTrack UserId
                                            // from your API Server to be configured in the HyperTrack SDK.
                                            [HyperTrack getOrCreateUser:self.username _phone:@"" :self.username
                                                      completionHandler:^(HyperTrackUser * _Nullable htuser,
                                                              HyperTrackError * _Nullable error) {
                                                          if (htuser) {
                                                              // Handle createUser success here, if required
                                                              // HyperTrack SDK auto-configures UserId on createUser API call,
                                                              // so no need to call [HyperTrack setUserId:@"USER_ID"] API

                                                              // Handle createUser API success here
                                                              [self onUserLoginSuccess];
                                                          } else {
                                                              // Handle createUser error here, if required
                                                              [self showAlert:@"Error while creating pfuser" message:error.debugDescription];
                                                              NSLog(@"%@", error.debugDescription);
                                                          }
                                                      }];
                                        } else {
                                            [self showAlert:@"Error while logging in" message:error.debugDescription];
                                            NSLog(@"%@", error.debugDescription);
                                        }
                                    }];
}
- (IBAction)onRegisterClicked:(id)sender {
    PFUser* pfuser = [PFUser user];
    pfuser.username = self.username;
    pfuser.password = self.password;

    [pfuser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(!error) {
            // Get or Create a User for given lookupId on HyperTrack Server here to login
            // your pfuser & configure HyperTrack SDK with this generated HyperTrack UserId.
            // OR
            // Implement your API call for User Login and get back a HyperTrack UserId
            // from your API Server to be configured in the HyperTrack SDK.
            [HyperTrack getOrCreateUser:self.username _phone:@"" :@""
                      completionHandler:^(HyperTrackUser * _Nullable htuser,
                              HyperTrackError * _Nullable error) {
                          if (htuser) {
                              // Handle createUser success here, if required
                              // HyperTrack SDK auto-configures UserId on createUser API call,
                              // so no need to call [HyperTrack setUserId:@"USER_ID"] API

                              // Handle createUser API success here
                              [self onUserLoginSuccess];
                          } else {
                              // Handle createUser error here, if required
                              [self showAlert:@"Error while creating pfuser" message:error.debugDescription];
                              NSLog(@"%@", error.debugDescription);
                          }
                      }];
        }
        else {
            [self showAlert:@"Error while registering" message:error.debugDescription];
            NSLog(@"%@", error.debugDescription);
//            NSString* errorString = [error userInfo][@"error"];
            // Something went wrong; the error string is in errorString
        }
    }];
}

-(void)onUserLoginSuccess {
    // Start tracking the user on successful login. This indicates the user
    // is online.
    [HyperTrack startTracking];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.username forKey:@"current_username"];
    [userDefaults setObject:self.password forKey:@"current_password"];
    [userDefaults synchronize];
    [self performSegueWithIdentifier:@"MainTabView" sender:self];
}

- (void) showAlert: (NSString *)title
           message: (nullable NSString *)message {

    // create the alert
    UIAlertView *alertView = [[UIAlertView alloc]
            initWithTitle:title
                  message:message
                 delegate:self
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];
    // create the alert
    [alertView show];
}
@end
