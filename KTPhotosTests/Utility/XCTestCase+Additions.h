//
//  XCTestCase+Additions.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <XCTest/XCTest.h>

typedef void(^KTTestBlock)(void);

@interface XCTestCase (Additions)

/**
 * @abstract Wait for the default time interval and run block.
 * @param block Block that is supposed to run after the time interval.
 */
- (void)waitAndTest:(KTTestBlock)block;

/**
 * @abstract Wait for the default time interval and run block.
 * @param seconds The time interval to wait.
 * @param block Block that is supposed to run after the time interval.
 */
- (void)wait:(NSTimeInterval)seconds andTest:(KTTestBlock)block;

@end
