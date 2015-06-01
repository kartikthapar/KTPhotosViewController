//
//  XCTestCase+Additions.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "XCTestCase+Additions.h"

#define kDefaultTimeInterval 0.01

@implementation XCTestCase (Additions)

- (void)waitAndTest:(KTTestBlock)block;
{
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:kDefaultTimeInterval]];
    block();
}

- (void)wait:(NSTimeInterval)seconds andTest:(KTTestBlock)block;
{
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:seconds]];
    block();
}

@end
