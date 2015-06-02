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

- (void)testPhotosCollectionViewCell
{
    KTPhotosCollectionViewCell *collectionViewCell = [[KTPhotosCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 75, 75)];
    XCTAssertNotNil(collectionViewCell, @"cell cannot be nil");
    
    NSString *cellId = [KTPhotosCollectionViewCell cellReuseIdentifier];
    XCTAssertNotNil(cellId, @"cell reuse identifier cannot be nil");
    XCTAssertEqualObjects(cellId, NSStringFromClass([KTPhotosCollectionViewCell class]));
    
    KTPhotosThumbnailImageView *photoImageView = collectionViewCell.photoImageView;
    XCTAssertNotNil(photoImageView, @"photoImageView cannot be nil");
    [collectionViewCell layoutIfNeeded];
    XCTAssertEqual(photoImageView.frame.size.width, collectionViewCell.frame.size.width, @"photoImageView width should be same as that of collectionViewCell's");
    XCTAssertEqual(photoImageView.frame.size.height, collectionViewCell.frame.size.height, @"photoImageView height should be same as that of collectionViewCell's");
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
