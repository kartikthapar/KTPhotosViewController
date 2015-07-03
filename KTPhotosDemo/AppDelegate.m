//
//  AppDelegate.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "AppDelegate.h"

#import "SampleGridViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // testing a darker theme
//    [[KTPhotosSectionHeaderView appearance] setBlurEffectStyle:UIBlurEffectStyleDark];
//    [[KTPhotosCollectionView appearance] setBackgroundColor:[UIColor darkGrayColor]];
//    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackTranslucent];

    SampleGridViewController *gridViewController = [[SampleGridViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:gridViewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navigationController;
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window makeKeyAndVisible];
    return YES;
}

@end
