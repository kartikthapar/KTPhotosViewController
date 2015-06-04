//
//  KTPhotosSectionInfoHeaderViewTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "KIF.h"
#import "Expecta.h"
#import "XCTUtility.h"

#import "KTPhotos.h"

#import "KTTestCollectionViewModel.h"

@interface KTPhotosSectionInfoHeaderViewTests : XCTestCase

@property (nonatomic, strong) KTTestCollectionViewModel *testCollectionViewModel;

@end

@implementation KTPhotosSectionInfoHeaderViewTests

- (void)setUp
{
    [super setUp];
    
    self.testCollectionViewModel = [KTTestCollectionViewModel new];
}

- (void)tearDown
{
    XCT_DismissViewController();
    [super tearDown];
}

#pragma mark - Tests

- (void)testPhotosSectionInfoHeaderViewInit
{
    KTPhotosSectionInfoHeaderView *headerView = [[KTPhotosSectionInfoHeaderView alloc] init];
    expect(headerView).toNot.beNil();
    expect([KTPhotosSectionInfoHeaderView headerReuseIdentifier]).to.equal(NSStringFromClass([KTPhotosSectionInfoHeaderView class]));
}

- (void)testPhotosSectionInfoHeaderViewDisplay
{
    [self presentPhotosSectionInfoHeaderView];
    
    [tester waitForViewWithAccessibilityLabel:KTPhotosSectionInfoHeaderViewAccessibilityLabel];
}

#pragma mark - Internal

- (void)presentPhotosSectionInfoHeaderView
{
    UICollectionViewController *controller = [self.testCollectionViewModel defaultCollectionViewController];
    XCT_PresentViewController(controller);
}

@end
