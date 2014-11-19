//
//  CALocalNotificationManager.m
//  LocalPushNotificationDemo
//
//  Created by ChildhoodAndy on 14-11-19.
//  Copyright (c) 2014年 ChildhoodAndy. All rights reserved.
//

#import "CALocalNotificationManager.h"

@implementation CALocalNotificationManager

+ (instancetype)sharedInstance
{
    static CALocalNotificationManager* instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^(void){
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (void)clearApplicatonIconBadgeNumber
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)clearAllLocalNotifications
{
    UIApplication* app = [UIApplication sharedApplication];
    [app cancelAllLocalNotifications];
    app.applicationIconBadgeNumber = 0;
}

- (NSUInteger)scheduledLocalNotificatonsNum
{
    NSLog(@"UIApplication scheduledLocalNotificatonsNum %d", [[UIApplication sharedApplication] scheduledLocalNotifications].count);
    return [[UIApplication sharedApplication] scheduledLocalNotifications].count;
}

@end