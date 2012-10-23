//
//  CrashRepoter.m
//  CrashReporter
//
//  Created by c on 12-10-22.
//  Copyright (c) 2012年 stylejar. All rights reserved.
//

#import "CrashRepoter.h"

@implementation CrashRepoter


static void processHandler(NSException* exception){
    //time info
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *crashTime   = [dateFormatter stringFromDate:[NSDate date]];

    //app info
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];

    //device info
    UIDevice *device = [UIDevice currentDevice];
    NSString *deviceName  = [device name];
    NSString *deviceModel = [device model];
    NSString *deviceVersion = [device systemVersion];
    NSLog(@"[Device Info %@]Name:%@, Model:%@, DeviceVersion:%@,  AppVersion:%@\n", crashTime, deviceName, deviceModel, deviceVersion, appVersion);

    //crash info
    NSString *name   = [exception name];
    NSString *reason = [exception reason];
    NSArray *symbols = [exception callStackSymbols];
    NSMutableString *symbolString = [[NSMutableString alloc] init];
    for (NSString *item in symbols) {
        [symbolString appendFormat:@"%@ \n",item];
    }
    NSLog(@"[Uncaught Exception]Name:%@, Reason:%@ \n[Symbols Start]\n%@\n[Symbols End]\n", name, reason, symbolString);
}

+(void)bindCrashRepoter{
    NSSetUncaughtExceptionHandler(&processHandler);
}

@end
