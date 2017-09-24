//
// Created by Yiru Yao on 9/23/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LoginController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property(nonatomic, retain) NSString *username;
@property(nonatomic, retain) NSString *password;
@end
