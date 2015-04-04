//
//  RAAppDelegate.m
//  Recipe App
//
//  Created by Joshua Howland on 5/21/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "RAAppDelegate.h"
#import "RAViewController.h"

@implementation RAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    
    // initialize a UINavigationController with a recipeViewController instance as the rootViewController
    RAViewController *viewController = [RAViewController new];
    
    // Embed the navigation controller in the view controller
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    // Make the navigationController the rootViewController of the window
    self.window.rootViewController = navController;

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
