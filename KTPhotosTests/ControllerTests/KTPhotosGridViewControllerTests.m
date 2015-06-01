//
//  KTPhotosGridViewControllerTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "KTPhotosGridViewController.h"
#import "KTPhotosCollectionViewCell.h"

@interface KTPhotosGridViewController ()

- (void)kt_configurePhotosViewController;

@end

@interface KTPhotosViewControllerTests : XCTestCase

@end

@implementation KTPhotosViewControllerTests

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Tests

- (void)testKTMessagesViewControllerInit
{
    KTPhotosGridViewController *vc = [KTPhotosGridViewController photosViewController];
    [vc view];
    
    XCTAssertNotNil(vc, @"View controller should not be nil");
    XCTAssertNotNil(vc.view, @"View should not be nil");
    XCTAssertNotNil(vc.collectionView, @"Collection view should not be nil");
    
    XCTAssertEqual(vc.automaticallyAdjustsScrollViewInsets, YES, @"Property should be equal to default value");
    
    XCTAssert([vc.photoCellIdentifier isEqualToString:[KTPhotosCollectionViewCell cellReuseIdentifier]], @"Property should be equal to the default value");
}

- (void)testViewConfiguration
{
    KTPhotosGridViewController *vc = [KTPhotosGridViewController photosViewController];
    
    id mockVC = [OCMockObject partialMockForObject:vc];
    [[mockVC expect] kt_configurePhotosViewController];
    [vc view];
    [mockVC verify];
}

@end
