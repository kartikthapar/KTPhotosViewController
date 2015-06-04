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

#import "KTPhotos.h"

@interface KTPhotosSectionInfoHeaderViewTests : XCTestCase <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation KTPhotosSectionInfoHeaderViewTests

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
    // create a view controller
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionViewController *controller = [[UICollectionViewController alloc] initWithCollectionViewLayout:layout];
    controller.view.backgroundColor = [UIColor whiteColor];
    controller.collectionView.backgroundColor = [UIColor whiteColor];
    controller.collectionView.dataSource = self;
    controller.collectionView.delegate = self;
    [controller.collectionView registerClass:[KTPhotosSectionInfoHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[KTPhotosSectionInfoHeaderView headerReuseIdentifier]];
    
    // present this view controller
    UINavigationController *presentingController = [[UINavigationController alloc] initWithRootViewController:controller];
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController presentViewController:presentingController animated:YES completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[KTPhotosSectionInfoHeaderView headerReuseIdentifier] forIndexPath:indexPath];
    }
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.bounds.size.width, 44.0f);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)dismiss
{
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
