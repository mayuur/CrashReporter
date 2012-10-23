//
//  main.m
//  CrashReporter
//
//  Created by c on 12-10-22.
//  Copyright (c) 2012年 stylejar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "CrashRepoter.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [CrashRepoter bindCrashRepoter];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
