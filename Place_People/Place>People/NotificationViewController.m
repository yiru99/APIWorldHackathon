//
//  NotificationViewController.m
//  Place>People
//
//  Created by Jia Wern Yong on 23/9/17.
//  Copyright © 2017 APIWorldHackathon. All rights reserved.
//

#import "NotificationViewController.h"


@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"What's on your mind?" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* post= [UIAlertAction actionWithTitle:@"Post" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                     {
                         //put your navigation code here
                         // *** THIS IS WHERE YOU NAVIGATE TO LOGIN
//                         UIViewController *storyboard = [[UIStoryboard storyboardWithName:@"main" bundle:nil]
//                             instantiateViewControllerWithIdentifier:@"ViewController"];
//                         [self.navigationController pushViewController:viewController animated:YES];
                     }];
    
    [alertController addAction:post];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter Message";
    }]; // 10
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)isInGeofence {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Join Hostel A Feed?" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil]];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter Password";
    }]; // 10
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
