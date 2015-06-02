//
//  KTPhotosThumbnailImageViewTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "KTPhotos.h"

@interface KTPhotosThumbnailImageView ()

- (void)kt_configureThumbnailImageView;

@end

@interface KTPhotosThumbnailImageViewTests : XCTestCase

@end

@implementation KTPhotosThumbnailImageViewTests

#pragma mark - Setup

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

- (void)testPhotosThumbnailImageViewInit
{
    KTPhotosThumbnailImageView *photoImageView = [[KTPhotosThumbnailImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    XCTAssertNotNil(photoImageView, @"photoImageView cannot be nil");
}

@end
