//
//  CAAppDelegate.m
//  LocalPushNotificationDemo
//
//  Created by ChildhoodAndy on 14-11-8.
//  Copyright (c) 2014年 ChildhoodAndy. All rights reserved.
//

#import "CAAppDelegate.h"
#import "CALocalNotificationManager.h"

@implementation CAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[CALocalNotificationManager sharedInstance] clearAllLocalNotifications];
    
    UILocalNotification* localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) {
        NSString* content = [localNotif.userInfo objectForKey:@"test"];
        application.applicationIconBadgeNumber = localNotif.applicationIconBadgeNumber - 1;
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"LocalNotification" message:[NSString stringWithFormat:@"%@", content] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive");
//    [application setApplicationIconBadgeNumber:0];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"didReceiveLocalNotification");
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"LocalNotification" message:[NSString stringWithFormat:@"%@", [notification.userInfo objectForKey:@"test"]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
