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

#import "KTPhotos.h"

#import "SamplePhotosCollectionViewCell.h"
#import "SamplePhotosSectionInfoHeaderView.h"

@interface KTPhotosCollectionViewTests : XCTestCase <KTPhotosCollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation KTPhotosCollectionViewTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    [self dismiss];
    [super tearDown];
}

#pragma mark - Tests

- (void)testPhotosCollectionViewInit
{
    KTPhotosCollectionView *collectionView = [self photosCollectionView];
    expect(collectionView).toNot.beNil();
    expect(collectionView.collectionViewLayout).toNot.beNil();
    expect(collectionView.cellIdentifier).to.equal([KTPhotosCollectionViewCell cellReuseIdentifier]);
    expect(collectionView.cellClass).to.equal([KTPhotosCollectionViewCell class]);
    expect(collectionView.sectionInfoHeaderClass).to.equal([KTPhotosSectionInfoHeaderView class]);
    expect(collectionView.sectionInfoHeaderIdentifier).to.equal([KTPhotosSectionInfoHeaderView headerReuseIdentifier]);
}

- (void)testPhotosCollectionViewDisplay
{
    KTPhotosCollectionView *collectionView = [self photosCollectionView];
    
    [self presentPhotosCollectionView:collectionView];
    
    [tester waitForViewWithAccessibilityLabel:KTPhotosCollectionViewCellAccessibilityLabel];
}

- (void)testPhotosCollectionViewWithCustomCellClass
{
    KTPhotosCollectionView *collectionView = [self photosCollectionView];
    collectionView.cellClass = [SamplePhotosCollectionViewCell class];
    expect(collectionView.cellClass).to.equal([SamplePhotosCollectionViewCell class]);
    
    [self presentPhotosCollectionView:collectionView];
    
    [tester waitForViewWithAccessibilityLabel:SampleCollectionViewCellAccessibilityLabel];
}

- (void)testPhotosCollectionViewWithCustomCellIdentifier
{
    KTPhotosCollectionView *collectionView = [self photosCollectionView];
    NSString *cellIdentifier = [SamplePhotosCollectionViewCell cellReuseIdentifier];
    collectionView.cellIdentifier = cellIdentifier;
    expect(collectionView.cellIdentifier).to.equal(cellIdentifier);
    
    [self presentPhotosCollectionView:collectionView];
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[tester waitForViewWithAccessibilityLabel:KTPhotosCollectionViewCellAccessibilityLabel];
    expect(cell.reuseIdentifier).to.equal(cellIdentifier);
}

- (void)testPhotosCollectionViewWithCustomSectionHeaderClass
{
    KTPhotosCollectionView *collectionView = [self photosCollectionView];
    collectionView.sectionInfoHeaderClass = [SamplePhotosSectionInfoHeaderView class];
    expect(collectionView.sectionInfoHeaderClass).to.equal([SamplePhotosSectionInfoHeaderView class]);

    [self presentPhotosCollectionView:collectionView];
    
    [tester waitForViewWithAccessibilityLabel:SamplePhotosSectionInfoHeaderViewAccessibilityLabel];
}

- (void)testPhotosCollectionViewWithCustomSectionHeaderIdentifier
{
    KTPhotosCollectionView *collectionView = [self photosCollectionView];
    collectionView.sectionInfoHeaderIdentifier = [SamplePhotosSectionInfoHeaderView headerReuseIdentifier];
    expect(collectionView.sectionInfoHeaderIdentifier).to.equal([SamplePhotosSectionInfoHeaderView headerReuseIdentifier]);
    
    [self presentPhotosCollectionView:collectionView];
    
    [tester waitForViewWithAccessibilityLabel:KTPhotosSectionInfoHeaderViewAccessibilityLabel];
}

#pragma mark - Internal

- (KTPhotosCollectionView *)photosCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    KTPhotosCollectionView *collectionView = [[KTPhotosCollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:flowLayout];
    return collectionView;
}

- (void)presentPhotosCollectionView:(KTPhotosCollectionView *)collectionView
{
    UICollectionViewController *controller = [[UICollectionViewController alloc] initWithCollectionViewLayout:nil];
    controller.collectionView = collectionView;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    // present this view controller
    UINavigationController *presentingController = [[UINavigationController alloc] initWithRootViewController:controller];
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController presentViewController:presentingController animated:YES completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTPhotosCollectionView *photoCollectionView = (KTPhotosCollectionView *)collectionView;
    
    NSString *cellId = photoCollectionView.cellIdentifier;
    UICollectionViewCell<KTPhotosThumbnailPresenting> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(KTPhotosCollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:collectionView.sectionInfoHeaderIdentifier forIndexPath:indexPath];
    }
    return view;
}

- (id <KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView photoDataItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTThumbnailItem *item = [[KTThumbnailItem alloc] initWithImage:[UIImage new] date:[NSDate date] cacheId:@"cacheId"];
    return item;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.bounds.size.width, 44.0f);
}

- (void)dismiss
{
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
