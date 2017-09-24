//
// Created by Yiru Yao on 9/23/17.
// Copyright (c) 2017 APIWorldHackathon. All rights reserved.
//

#import "FeedController.h"
#import "User.h"
#import "Post.h"
#import "Place.h"
@import Parse;


@implementation FeedController

- (void)viewDidLoad {
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleUsersNotification:)
//                                                 name:@"usersDataChanged"
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handlePlacesNotification:)
//                                                 name:@"placesDataChanged"
//                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handlePostsNotification:)
                                                 name:@"postsDataChanged"
                                               object:nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Hi! Looks like you are in APIWorld:)" message:@"Would you like to join our hyper local blob?" delegate:self cancelButtonTitle:@"Join Blob!" otherButtonTitles:@"I am a loner."];
    [alert show];
}
//- (id)init {
//    self = [super init];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleUsersNotification:)
//                                                 name:@"usersDataChanged"
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handlePlacesNotification:)
//                                                 name:@"placesDataChanged"
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handlePostsNotification:)
//                                                 name:@"postsDataChanged"
//                                               object:nil];
//    return self;
//}

//- (void)handleUsersNotification:(NSNotification *)notification {
//    NSDictionary* userInfo = notification.userInfo;
//    self.users = userInfo[@"users"];
//    if (self.places && self.posts)
//        [self.tableView reloadData];
//}
//
//- (void)handlePlacesNotification:(NSNotification *)notification {
//    NSDictionary* userInfo = notification.userInfo;
//    self.places = userInfo[@"places"];
//    if (self.posts && self.users)
//        [self.tableView reloadData];
//}

- (void)handlePostsNotification:(NSNotification *)notification {
    NSDictionary* userInfo = notification.userInfo;
    self.posts = userInfo[@"posts"];
    if (self.shouldReload)
        [self.tableView reloadData];
    else
        self.shouldReload = YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        if (self.shouldReload)
            [self.tableView reloadData];
        else
            self.shouldReload = YES;
    }
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts ? self.posts.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UILabel *usernameLabel;
    UIImageView *userPic;
    UILabel *postedTime;
    UILabel *contentLabel;
    UIButton *likeButton;
    UIButton *commentButton;
    UILabel *countdownLabel;
    UILabel *distanceLabel;
    static NSInteger usernameTag = 1;
    static NSInteger userPicTag = 2;
    static NSInteger postedTimeTag = 3;
    static NSInteger contentTag = 4;
    static NSInteger likeTag = 5;
    static NSInteger commentTag = 6;
    static NSInteger countdownTag = 7;
    static NSInteger distanceTag = 8;
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    CGFloat IMAGE_SIZE = 30;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.backgroundColor = [UIColor whiteColor];

        CGFloat dx = 15;
        CGFloat left;
        userPic = [[UIImageView alloc] initWithFrame:CGRectMake(dx-3, (44 - IMAGE_SIZE)/2, IMAGE_SIZE, IMAGE_SIZE)];
        userPic.layer.cornerRadius = 15;
        userPic.layer.masksToBounds = YES;
        userPic.tag = userPicTag;
        userPic.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:userPic];
        left = userPic.frame.origin.x + IMAGE_SIZE + 10;
        CGFloat width = tableView.frame.size.width - 2*15 - 2*5 - IMAGE_SIZE - 7;

        usernameLabel = [[UILabel alloc] initWithFrame:CGRectMake(left, (44 - IMAGE_SIZE)/2, width - 50, IMAGE_SIZE)];
        usernameLabel.tag = usernameTag;
        usernameLabel.textColor = [UIColor darkTextColor];
        usernameLabel.backgroundColor = [UIColor clearColor];
        usernameLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:usernameLabel];

        left = left + width - 50;
        postedTime = [[UILabel alloc] initWithFrame:CGRectMake(left, (44 - IMAGE_SIZE)/2, 50, IMAGE_SIZE)];
        postedTime.tag = postedTimeTag;
        postedTime.adjustsFontSizeToFitWidth = YES;
        postedTime.textColor = [UIColor grayColor];
        postedTime.backgroundColor = [UIColor clearColor];
        postedTime.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:postedTime];

        left = usernameLabel.frame.origin.x;
        contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(left, userPic.frame.origin.y+IMAGE_SIZE, usernameLabel.frame.size.width + postedTime.frame.size.width, 80)];
        contentLabel.tag = contentTag;
        contentLabel.textColor = [UIColor darkTextColor];
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.textAlignment = NSTextAlignmentLeft;
        contentLabel.numberOfLines = 3;
        [cell.contentView addSubview:contentLabel];

        left = usernameLabel.frame.origin.x;
        CGFloat top = contentLabel.frame.origin.y + contentLabel.frame.size.height;
        width = contentLabel.frame.size.width / 4;
        likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        likeButton.frame = CGRectMake(left, top, width/2 - 8, 25);
        likeButton.tag = likeTag;
        likeButton.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:likeButton];

        left += (width-20);
        commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        commentButton.frame = CGRectMake(left, top, width/2 - 8, 25);
        commentButton.tag = commentTag;
        commentButton.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:commentButton];

        left += (width+80);
        countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(left, top, width/2, 25)];
        countdownLabel.tag = countdownTag;
        countdownLabel.backgroundColor = [UIColor clearColor];
        countdownLabel.textColor = [UIColor redColor];
        countdownLabel.adjustsFontSizeToFitWidth = YES;
        [cell.contentView addSubview:countdownLabel];

        left += (width-20);
        distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(left, top, width/2, 25)];
        distanceLabel.tag = distanceTag;
        distanceLabel.backgroundColor = [UIColor clearColor];
        distanceLabel.adjustsFontSizeToFitWidth = YES;
        [cell.contentView addSubview:distanceLabel];
    }
    else {
        usernameLabel = [cell.contentView viewWithTag:usernameTag];
        userPic = [cell.contentView viewWithTag:userPicTag];
        postedTime = [cell.contentView viewWithTag:postedTimeTag];
        contentLabel = [cell.contentView viewWithTag:contentTag];
        likeButton = [cell.contentView viewWithTag:likeTag];
        commentButton = [cell.contentView viewWithTag:commentTag];
        countdownLabel = [cell.contentView viewWithTag:countdownTag];
        distanceLabel = [cell.contentView viewWithTag:distanceTag];
    }

    Post *post = self.posts[indexPath.row];

    usernameLabel.text = post.author;
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: post.imageUrl]];
    userPic.image = [UIImage imageWithData: imageData];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm"];
    postedTime.text = [formatter stringFromDate:post.createdAt];
    contentLabel.text = post.content;

    imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://icons.iconarchive.com/icons/icons8/ios7/256/Messaging-Like-icon.png"]];
    [likeButton setBackgroundImage:[UIImage imageWithData: imageData]forState:UIControlStateNormal];

    imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: @"http://www.iconsfind.com/wp-content/uploads/2015/11/20151104_563963d2d1204.png"]];
    [commentButton setBackgroundImage:[UIImage imageWithData: imageData] forState:UIControlStateNormal];

    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"timer.png"];
    NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
    NSMutableAttributedString *myString= [[NSMutableAttributedString alloc] initWithString:@"05:20"];
    [myString appendAttributedString:attachmentString];
    countdownLabel.attributedText = myString;
    countdownLabel.textAlignment = NSTextAlignmentRight;

    NSTextAttachment *attachment1 = [[NSTextAttachment alloc] init];
    attachment1.image = [UIImage imageNamed:@"map_pin.png"];
    NSAttributedString *attachmentString1 = [NSAttributedString attributedStringWithAttachment:attachment];
    NSMutableAttributedString *myString1= [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat: @"%.1f mi", post.distance.floatValue]];
    [myString1 appendAttributedString:attachmentString1];
    distanceLabel.attributedText = myString1;
    distanceLabel.textAlignment = NSTextAlignmentRight;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (void)likeApost {

}

- (void)commentApost {

}


- (IBAction)newPostBtn:(id)sender {
    NSLog(@"New Post Button clicked");
    [self performSegueWithIdentifier:@"NewPostView" sender:self];

}
@end
