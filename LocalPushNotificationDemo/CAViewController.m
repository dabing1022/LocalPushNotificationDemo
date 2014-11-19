//
//  CAViewController.m
//  LocalPushNotificationDemo
//
//  Created by ChildhoodAndy on 14-11-8.
//  Copyright (c) 2014年 ChildhoodAndy. All rights reserved.
//

#import "CAViewController.h"
#import "CALocalNotificationManager.h"

@interface CAViewController ()
{
    UIApplication* app;
}

@property (nonatomic, weak) IBOutlet UITextView* infoTextView;

- (IBAction)localPushNotificationTest01:(id)sender;
- (IBAction)localPushNotificationTest02:(id)sender;
- (IBAction)localPushNotificationTest03:(id)sender;
@end

@implementation CAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    app = [UIApplication sharedApplication];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)localPushNotificationTest01:(id)sender
{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:10];
    
    UILocalNotification* notification = [[UILocalNotification alloc] init];
    notification.fireDate = date;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.repeatInterval = NSCalendarUnitDay;
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.alertBody = [NSString stringWithFormat:@"[Test01]10s notification--- %d", [UIApplication sharedApplication].applicationIconBadgeNumber];
    notification.alertAction = @"查看消息";
    notification.applicationIconBadgeNumber = [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    [notification setUserInfo:[NSDictionary dictionaryWithObject:@"[Test01]10s notification" forKey:@"test"]];

//    BOOL isInSchedule = NO;
//    for (UILocalNotification* notification in app.scheduledLocalNotifications) {
//        if ([notification.userInfo objectForKey:@"test"]) {
//            NSLog(@"test exsit");
//            isInSchedule = YES;
//        }
//    }
//    if (!isInSchedule) {
//        NSLog(@"test01 not exsit");
        [app scheduleLocalNotification:notification];
//    }
    
    [self getLocalNotificationsInfo];
}

- (IBAction)localPushNotificationTest02:(id)sender
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear: 2014];
    [components setMonth: 11];
    [components setDay: 19];
    [components setHour: 10];
    [components setMinute: 56];
    [components setSecond: 0];
    [calendar setTimeZone: [NSTimeZone defaultTimeZone]];
    NSDate *dateToFire = [calendar dateFromComponents:components];
     
    UILocalNotification* notification = [[UILocalNotification alloc] init];
    notification.fireDate = dateToFire;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.repeatInterval = NSMinuteCalendarUnit;
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.alertBody = [NSString stringWithFormat:@"[Test02]NSMinuteCalendarUnit notification--- %d", [UIApplication sharedApplication].applicationIconBadgeNumber];
    notification.applicationIconBadgeNumber = 1;
    [notification setUserInfo:[NSDictionary dictionaryWithObject:@"[Test03]NSMinuteCalendarUnit notification" forKey:@"test"]];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    [self getLocalNotificationsInfo];
}

- (IBAction)localPushNotificationTest03:(id)sender
{
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:10];
    
    UILocalNotification* notification = [[UILocalNotification alloc] init];
    notification.fireDate = date;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.repeatInterval = NSWeekCalendarUnit;
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.alertBody = [NSString stringWithFormat:@"[Test03] 立刻呈现--- %d", [UIApplication sharedApplication].applicationIconBadgeNumber];
    notification.alertAction = @"查看消息";
    notification.applicationIconBadgeNumber = 1;
    [notification setUserInfo:[NSDictionary dictionaryWithObject:@"[Test03] 立刻呈现" forKey:@"test"]];
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    
    [self getLocalNotificationsInfo];
}

- (void)getLocalNotificationsInfo
{
    NSUInteger localNotificationsNum = [[CALocalNotificationManager sharedInstance] scheduledLocalNotificatonsNum];
    NSString* info = [NSString stringWithFormat:@"本地推送目前有 %d 个", localNotificationsNum];
    for (UILocalNotification* notif in app.scheduledLocalNotifications) {
        if (notif.userInfo) {
            for (NSString* key in notif.userInfo.allKeys) {
                info = [info stringByAppendingString:[NSString stringWithFormat:@"\n--->UserInfo key: %@, value: %@", key, [notif.userInfo objectForKey:key]]];
            }
        }
    }
    self.infoTextView.text = info;
}

@end
