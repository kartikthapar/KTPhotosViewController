//
//  KTPhotosCollectionViewCellTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "KTPhotos.h"

@interface KTPhotosCollectionViewCellTests : XCTestCase

@end

@implementation KTPhotosCollectionViewCellTests

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

- (void)testMessageCollectionViewCellInit
{
    KTPhotosCollectionViewCell *collectionViewCell = [[KTPhotosCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 75, 75)];
    XCTAssertNotNil(collectionViewCell, @"cell cannot be nil");
    
    NSString *cellId = [KTPhotosCollectionViewCell cellReuseIdentifier];
    XCTAssertNotNil(cellId, @"cell reuse identifier cannot be nil");
    XCTAssertEqualObjects(cellId, NSStringFromClass([KTPhotosCollectionViewCell class]));
    
    UIImageView *photoImageView = collectionViewCell.photoImageView;
    XCTAssertNotNil(photoImageView, @"photoImageView cannot be nil");
}

@end
