//
//  ViewController.m
//  PeerReview7
//
//  Created by Ananta Shahane on 6/16/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *NotifyButton;
-(void) RequesttoNotify;
-(void) createNotificationAfterTime:(int)secondsinFuture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) RequesttoNotify
{
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];

    return;
}

-(void) createNotificationAfterTime:(int)secondsinFuture
{
    UILocalNotification * localNotif = [[UILocalNotification alloc] init];

    localNotif.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsinFuture];
    localNotif.timeZone = nil;
    
    localNotif.alertTitle = @"Peer Review 7";
    localNotif.alertBody = @"Times up";
    localNotif.alertAction = @"Ok";
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    
    localNotif.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
    return;
}

- (IBAction)onClickedNotifyMe:(id)sender {
    
    [self RequesttoNotify];
    [self createNotificationAfterTime:15];
    return;
}

@end
