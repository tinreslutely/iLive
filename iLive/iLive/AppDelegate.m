//
//  AppDelegate.m
//  iLive
//
//  Created by 李晓毅 on 16/3/14.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupWindow];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}


#pragma mark private methods
-(void)setupWindow{
    RESideMenu *menuController = [[RESideMenu alloc] initWithContentViewController:[[NSClassFromString(@"ILHomeViewController") alloc] init] leftMenuViewController:[[UIViewController alloc] init] rightMenuViewController:nil];
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    [self.window setRootViewController:menuController];
    [self.window makeKeyAndVisible];
}
@end
