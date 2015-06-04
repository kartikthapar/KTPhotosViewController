//
//  XCTestCase+Presentations.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "XCTestCase+Presentations.h"

@implementation XCTestCase (Presentations)

void XCT_PresentViewController(UIViewController *controller)
{
    // create a navigation controller with the specified view controller
    UINavigationController *presentingController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    // get the navigation controller from the application and present
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController presentViewController:presentingController animated:YES completion:nil];
}

void XCT_DismissViewController()
{
    // dismiss the view controller presented by the root view controller of the application
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
