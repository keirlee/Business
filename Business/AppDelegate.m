//
//  AppDelegate.m
//  Business
//
//  Created by keirleee on 13-12-3.
//  Copyright (c) 2013年 keirleee. All rights reserved.
//

#import "AppDelegate.h"
#import "MainPageViewController.h"
#import "ProductViewController.h"
#import "ShopViewController.h"
#import "NewsViewController.h"
#import "MemberCenterViewController.h"
#import "LeveyTabBarController.h"
#import "LeveyTabBar.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainPageViewController *manView = [[MainPageViewController alloc] initWithNibName:@"MainPageViewController" bundle:nil];
    ProductViewController *productView = [[ProductViewController alloc] initWithNibName:@"ProductViewController" bundle:nil];
    ShopViewController *shopView = [[ShopViewController alloc] initWithNibName:@"ShopViewController" bundle:nil];
    NewsViewController *newsView = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
    MemberCenterViewController *memberView = [[MemberCenterViewController alloc] initWithNibName:@"MemberCenterViewController" bundle:nil];
    
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIImage imageNamed:@"navBtn1Off"],[UIImage imageNamed:@"navBtn1On"],[UIImage imageNamed:@"navBtn1On"], nil] forKeys:[NSArray arrayWithObjects:@"Default",@"Highlighted",@"Selected", nil]];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIImage imageNamed:@"navBtn2Off"],[UIImage imageNamed:@"navBtn2On"],[UIImage imageNamed:@"navBtn2On"], nil] forKeys:[NSArray arrayWithObjects:@"Default",@"Highlighted",@"Selected", nil]];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIImage imageNamed:@"navBtn3Off"],[UIImage imageNamed:@"navBtn3On"],[UIImage imageNamed:@"navBtn3On"], nil] forKeys:[NSArray arrayWithObjects:@"Default",@"Highlighted",@"Selected", nil]];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIImage imageNamed:@"navBtn4Off"],[UIImage imageNamed:@"navBtn4On"],[UIImage imageNamed:@"navBtn4On"], nil] forKeys:[NSArray arrayWithObjects:@"Default",@"Highlighted",@"Selected", nil]];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIImage imageNamed:@"navBtn5Off"],[UIImage imageNamed:@"navBtn5On"],[UIImage imageNamed:@"navBtn5On"], nil] forKeys:[NSArray arrayWithObjects:@"Default",@"Highlighted",@"Selected", nil]];
    NSArray *array = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4,dic5, nil];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:manView];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:productView];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:shopView];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:newsView];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:memberView];
    NSArray *viewArray = [NSArray arrayWithObjects:nav1,nav2,nav3,nav4,nav5, nil];
    LeveyTabBarController *tabbar = [[LeveyTabBarController alloc] initWithViewControllers:viewArray imageArray:array];
    self.window.rootViewController = tabbar;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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

@end
