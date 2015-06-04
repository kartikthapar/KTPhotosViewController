//
//  KTPhotosCollectionViewCellTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
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

@interface KTPhotosCollectionViewCellTests : XCTestCase

@property (nonatomic, strong) KTTestCollectionViewModel *testCollectionViewModel;

@end

@implementation KTPhotosCollectionViewCellTests

- (void)setUp
{
    [super setUp];
    
    self.testCollectionViewModel = [KTTestCollectionViewModel new];
    
    [self resetAppearance];
}

- (void)tearDown
{
    XCT_DismissViewController();
    
    [super tearDown];
}

#pragma mark - Tests

- (void)testPhotosCollectionViewCellInit
{
    KTPhotosCollectionViewCell *cell = [[KTPhotosCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 75, 75)];
    expect(cell).toNot.beNil();
    
    expect([KTPhotosCollectionViewCell cellReuseIdentifier]).to.equal(NSStringFromClass([KTPhotosCollectionViewCell class]));
    
    KTPhotosThumbnailImageView *photoImageView = cell.photoImageView;
    expect(photoImageView).toNot.beNil();
    [cell layoutIfNeeded];
    expect(photoImageView.frame.size).to.equal(cell.frame.size);
}

- (void)testPhotosCollectionViewCellDefaultAppearance
{
    [self presentPhotosCollectionViewCell];
    
    KTPhotosCollectionViewCell *cell = (KTPhotosCollectionViewCell *)[tester waitForViewWithAccessibilityLabel:KTPhotosCollectionViewCellAccessibilityLabel];
    expect(cell.cellBackgroundColor).to.equal([UIColor whiteColor]);
}

- (void)testPhotosCollectionViewCellCustomAppeareance
{
    UIColor *backgroundColor = [UIColor blueColor];
    [[KTPhotosCollectionViewCell appearance] setCellBackgroundColor:backgroundColor];
    
    [self presentPhotosCollectionViewCell];
    
    KTPhotosCollectionViewCell *cell = (KTPhotosCollectionViewCell *)[tester waitForViewWithAccessibilityLabel:KTPhotosCollectionViewCellAccessibilityLabel];
    expect(cell.cellBackgroundColor).to.equal(backgroundColor);
}

- (void)testPhotosCollectionViewCellImplementsKTPhotosThumbnailPresenting
{
    KTPhotosCollectionViewCell *collectionViewCell = [[KTPhotosCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 75, 75)];
    expect([collectionViewCell respondsToSelector:@selector(updateWithPhotoItem:)]).to.equal(true);
}

#pragma mark - Internal

- (void)presentPhotosCollectionViewCell
{
    UICollectionViewController *controller = [self.testCollectionViewModel defaultCollectionViewController];
    XCT_PresentViewController(controller);
}

- (void)resetAppearance
{
    [[KTPhotosCollectionViewCell appearance] setCellBackgroundColor:[UIColor whiteColor]];
}

@end
