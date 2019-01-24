//
//  AppDelegate.m
//  PeerReview7
//
//  Created by Ananta Shahane on 6/16/17.
//  Copyright © 2017 Ananta Shahane. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    application.applicationIconBadgeNumber = 0;
    
    UILocalNotification *localNotif;
    localNotif = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if(localNotif)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Received on Launch" message:@"Received when app was asleep." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:alertAction];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
        });
    }
    
    
    return YES;
}

-(void) application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Received on foreground" message:@"Received when app was awake." preferredStyle:UIAlertControllerStyleAlert];
        
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
        
    [alertController addAction:alertAction];
        
    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    });

}

@end
