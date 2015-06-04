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

#import "KTPhotos.h"

#define KTTestCellId @"KTTestCellId"

@interface KTPhotosCollectionViewCellTests : XCTestCase <UICollectionViewDataSource>

@end

@implementation KTPhotosCollectionViewCellTests

- (void)setUp
{
    [super setUp];
    [self resetAppearance];
}

- (void)tearDown
{
    [self dismiss];
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
    // create a view controller
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionViewController *controller = [[UICollectionViewController alloc] initWithCollectionViewLayout:layout];
    controller.view.backgroundColor = [UIColor whiteColor];
    [controller.collectionView registerClass:[KTPhotosCollectionViewCell class] forCellWithReuseIdentifier:KTTestCellId];
    controller.collectionView.dataSource = self;
    
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
    KTPhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KTTestCellId forIndexPath:indexPath];
    return cell;
}

- (void)dismiss
{
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)resetAppearance
{
    [[KTPhotosCollectionViewCell appearance] setCellBackgroundColor:[UIColor whiteColor]];
}

@end
