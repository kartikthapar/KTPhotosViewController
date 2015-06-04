//
//  XCTestCase+Presentations.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>

@interface XCTestCase (Presentations)

/**
 * @abstract Presents the view controller modally assuming the root view controller is a `UINavigationController` instance.
 */
void XCT_PresentViewController(UIViewController *controller);

/**
 * @abstract Dismisses the view controller assuming the root view controller is a `UINavigationController` instance.
 */
void XCT_DismissViewController();

@end
