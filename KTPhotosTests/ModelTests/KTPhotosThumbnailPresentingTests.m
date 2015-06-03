//
//  KTPhotosThumbnailPresentingTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "KTPhotos.h"

@interface KTPhotosSampleThumbnailPresenting : NSObject <KTPhotosThumbnailPresenting>

@end

@implementation KTPhotosSampleThumbnailPresenting

- (void)updateWithPhotoItem:(id<KTPhotoData>)photoItem {}

@end

@interface KTPhotosThumbnailPresentingTests : XCTestCase

@end

@implementation KTPhotosThumbnailPresentingTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Tests

- (void)testPhotosSampleThumbnailPresentingInit
{
    KTPhotosSampleThumbnailPresenting *presenter = [[KTPhotosSampleThumbnailPresenting alloc] init];
    XCTAssertEqual([presenter respondsToSelector:@selector(updateWithPhotoItem:)], YES, @"presenter must implement `updateWithPhotoItem:`");
}

@end
