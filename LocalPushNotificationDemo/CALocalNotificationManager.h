//
//  CALocalNotificationManager.h
//  LocalPushNotificationDemo
//
//  Created by ChildhoodAndy on 14-11-19.
//  Copyright (c) 2014年 ChildhoodAndy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CALocalNotificationManager : NSObject

+ (instancetype)sharedInstance;

- (void)clearApplicatonIconBadgeNumber;
- (void)clearAllLocalNotifications;
- (NSUInteger)scheduledLocalNotificatonsNum;
@end
