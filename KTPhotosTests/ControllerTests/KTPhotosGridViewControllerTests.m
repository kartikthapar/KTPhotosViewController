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
#import "KIF.h"
#import "Expecta.h"

#import "KTPhotos.h"

#import "SampleGridViewController.h"

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

- (void)testKTPhotosGridViewControllerInit
{
    KTPhotosGridViewController *vc = [KTPhotosGridViewController photosViewController];
    [vc view];
    expect(vc).toNot.beNil();
    expect(vc.view).toNot.beNil();
    
    expect(vc.collectionView).to.beAnInstanceOf([KTPhotosCollectionView class]);
    expect(vc.collectionView.dataSource).to.conformTo(@protocol(KTPhotosCollectionViewDataSource));
    expect(vc.collectionView.collectionViewLayout).to.beAnInstanceOf([KTPhotosCollectionViewFlowLayout class]);
    
    expect(vc.collectionView).toNot.beNil();
    expect(vc.automaticallyAdjustsScrollViewInsets).to.equal(YES);
}

- (void)testKTPhotosGridViewControllerSubclassInit
{
    SampleGridViewController *sampleVC = [SampleGridViewController photosViewController];
    [sampleVC view];
    expect(sampleVC).toNot.beNil();
    expect([sampleVC isKindOfClass:[SampleGridViewController class]]).to.equal(YES);
    expect(sampleVC.view).toNot.beNil();
    expect(sampleVC.collectionView).toNot.beNil();
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
