//
//  NewPostController.h
//  Place>People
//
//  Created by Jia Wern Yong on 24/9/17.
//  Copyright © 2017 APIWorldHackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewPostController : UIViewController
- (IBAction)backBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *postText;
@property (strong, nonatomic) IBOutlet UIButton *postBtn;
-(int)getRandomNumberBetween:(int)from to:(int)to;


@end
