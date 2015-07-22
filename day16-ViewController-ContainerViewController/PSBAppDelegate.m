//
//  PSBAppDelegate.m
//  day16-ViewController-ContainerViewController
//
//  Created by 潘松彪 on 14-8-28.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import "PSBAppDelegate.h"
#import "PSBContainerViewController.h"
#import "PSBFirstViewController.h"
#import "PSBSecondViewController.h"

@implementation PSBAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

//添加视图控制器
- (void)createViewControllers
{
    //创建容器视图控制器
    PSBContainerViewController * cvc = [[PSBContainerViewController alloc] init];
    //创建两个子视图控制器
    PSBFirstViewController * fvc = [[PSBFirstViewController alloc] init];
    PSBSecondViewController * svc = [[PSBSecondViewController alloc] init];
    
    //将子视图控制器，添加给容器视图控制器进行管理
    [cvc addChildViewController:fvc];
    [cvc addChildViewController:svc];
    
    [fvc release];
    [svc release];
    
    //将容器视图控制器添加到window
    self.window.rootViewController = cvc;
    [cvc release];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //创建视图控制器
    [self createViewControllers];
    
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
