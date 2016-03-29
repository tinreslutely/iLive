//
//  AppDelegate.m
//  iLive
//
//  Created by 李晓毅 on 16/3/14.
//  Copyright © 2016年 301 Studio. All rights reserved.
//

#import "AppDelegate.h"
#import "DDTTYLogger.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupWindow];
    [self setupLogger];
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
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(@"ILCreditStoreDetailViewController") alloc] init]];
    RESideMenu *menuController = [[RESideMenu alloc] initWithContentViewController:navigationController leftMenuViewController:nil rightMenuViewController:[[UIViewController alloc] init]];
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
    [self.window setRootViewController:menuController];
    [self.window makeKeyAndVisible];
}

-(void)setupLogger{
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
}

@end
