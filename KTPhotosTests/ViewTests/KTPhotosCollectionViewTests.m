//
//  KTPhotosCollectionViewTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/3/15.
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

#import "SamplePhotosCollectionViewCell.h"
#import "SamplePhotosSectionInfoHeaderView.h"

@interface KTPhotosCollectionViewTests : XCTestCase

@property (nonatomic, strong) KTTestCollectionViewModel *testCollectionViewModel;

@end

@implementation KTPhotosCollectionViewTests

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

- (void)testPhotosCollectionViewInit
{
    KTPhotosCollectionView *collectionView = [self.testCollectionViewModel defaultCollectionView];
    expect(collectionView).toNot.beNil();
    expect(collectionView.collectionViewLayout).toNot.beNil();
    expect(collectionView.cellIdentifier).to.equal([KTPhotosCollectionViewCell cellReuseIdentifier]);
    expect(collectionView.cellClass).to.equal([KTPhotosCollectionViewCell class]);
    expect(collectionView.sectionInfoHeaderClass).to.equal([KTPhotosSectionHeaderView class]);
    expect(collectionView.sectionInfoHeaderIdentifier).to.equal([KTPhotosSectionHeaderView headerReuseIdentifier]);
}

- (void)testPhotosCollectionViewDisplay
{
    KTPhotosCollectionView *collectionView = [self.testCollectionViewModel defaultCollectionView];
    
    [self presentPhotosCollectionView:collectionView];
    
    [tester waitForViewWithAccessibilityLabel:KTPhotosCollectionViewCellAccessibilityLabel];
}

- (void)testPhotosCollectionViewWithCustomCellClass
{
    KTPhotosCollectionView *collectionView = [self.testCollectionViewModel defaultCollectionView];
    collectionView.cellClass = [SamplePhotosCollectionViewCell class];
    expect(collectionView.cellClass).to.equal([SamplePhotosCollectionViewCell class]);
    
    [self presentPhotosCollectionView:collectionView];
    
    [tester waitForViewWithAccessibilityLabel:SampleCollectionViewCellAccessibilityLabel];
}

- (void)testPhotosCollectionViewWithCustomCellIdentifier
{
    KTPhotosCollectionView *collectionView = [self.testCollectionViewModel defaultCollectionView];
    NSString *cellIdentifier = [SamplePhotosCollectionViewCell cellReuseIdentifier];
    collectionView.cellIdentifier = cellIdentifier;
    expect(collectionView.cellIdentifier).to.equal(cellIdentifier);
    
    [self presentPhotosCollectionView:collectionView];
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[tester waitForViewWithAccessibilityLabel:KTPhotosCollectionViewCellAccessibilityLabel];
    expect(cell.reuseIdentifier).to.equal(cellIdentifier);
}

- (void)testPhotosCollectionViewWithCustomSectionHeaderClass
{
    KTPhotosCollectionView *collectionView = [self.testCollectionViewModel defaultCollectionView];
    collectionView.sectionInfoHeaderClass = [SamplePhotosSectionInfoHeaderView class];
    expect(collectionView.sectionInfoHeaderClass).to.equal([SamplePhotosSectionInfoHeaderView class]);

    [self presentPhotosCollectionView:collectionView];
    
    [tester waitForViewWithAccessibilityLabel:SamplePhotosSectionInfoHeaderViewAccessibilityLabel];
}

- (void)testPhotosCollectionViewWithCustomSectionHeaderIdentifier
{
    KTPhotosCollectionView *collectionView = [self.testCollectionViewModel defaultCollectionView];
    collectionView.sectionInfoHeaderIdentifier = [SamplePhotosSectionInfoHeaderView headerReuseIdentifier];
    expect(collectionView.sectionInfoHeaderIdentifier).to.equal([SamplePhotosSectionInfoHeaderView headerReuseIdentifier]);
    
    [self presentPhotosCollectionView:collectionView];
    
    [tester waitForViewWithAccessibilityLabel:KTPhotosSectionHeaderViewAccessibilityLabel];
}

#pragma mark - Internal

- (void)presentPhotosCollectionView:(KTPhotosCollectionView *)collectionView
{
    UICollectionViewController *controller = [self.testCollectionViewModel collectionViewController:collectionView];
    XCT_PresentViewController(controller);
}

@end
