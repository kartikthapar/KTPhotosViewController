//
//  KTThumbnailItemTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "KTThumbnailItem.h"

@interface KTThumbnailItemTests : XCTestCase

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *cacheId;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) UIImage *image;

@end

@implementation KTThumbnailItemTests

- (void)setUp
{
    [super setUp];
    self.date = [NSDate date];
    self.cacheId = @"cacheId";
    self.imagePath = @"image_path";
    self.image = [UIImage new];
}

- (void)tearDown
{
    self.date = nil;
    self.cacheId = nil;
    self.imagePath = nil;
    self.image = nil;
    [super tearDown];
}

#pragma mark - Tests

- (void)testThumbnailItemInitWithImagePath
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImagePath:self.imagePath date:self.date cacheId:self.cacheId];
    XCTAssertNotNil(thumbnailItem, @"thumbnailItem cannot be nil");
    XCTAssertEqualObjects([thumbnailItem date], self.date, @"date must be equal to set date");
    XCTAssertEqualObjects([thumbnailItem cacheId], self.cacheId, @"cacheId must be equal to set cacheId");
    XCTAssertEqualObjects([thumbnailItem imagePath], self.imagePath, @"imagePath must be equal to set imagePath");
}

- (void)testThumbnailItemInitWithImage
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImage:self.image date:self.date cacheId:self.cacheId];
    XCTAssertNotNil(thumbnailItem, @"thumbnailItem cannot be nil");
    XCTAssertEqualObjects([thumbnailItem date], self.date, @"date must be equal to set date");
    XCTAssertEqualObjects([thumbnailItem cacheId], self.cacheId, @"cacheId must be equal to set cacheId");
    XCTAssertEqualObjects([thumbnailItem image], self.image, @"image must be equal to set imagePath");
}

- (void)testThumbnailItemArchivingForImagePath
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImagePath:self.imagePath date:self.date cacheId:self.cacheId];
 
    NSData *thumbnailData = [NSKeyedArchiver archivedDataWithRootObject:thumbnailItem];

    KTThumbnailItem *unarchivedThumbnailItem = [NSKeyedUnarchiver unarchiveObjectWithData:thumbnailData];
    
    XCTAssertEqualObjects(thumbnailItem.date, unarchivedThumbnailItem.date, @"date must be equal");
    XCTAssertEqualObjects(thumbnailItem.cacheId, unarchivedThumbnailItem.cacheId, @"cacheId must be equal");
    XCTAssertEqualObjects(thumbnailItem.imagePath, unarchivedThumbnailItem.imagePath, @"imagePath must be equal");
}

- (void)testThumbnailItemArchivingForImage
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImage:self.image date:self.date cacheId:self.cacheId];

    NSData *thumbnailData = [NSKeyedArchiver archivedDataWithRootObject:thumbnailItem];
    
    KTThumbnailItem *unarchivedThumbnailItem = [NSKeyedUnarchiver unarchiveObjectWithData:thumbnailData];

    XCTAssertEqualObjects(thumbnailItem.date, unarchivedThumbnailItem.date, @"date must be equal");
    XCTAssertEqualObjects(thumbnailItem.cacheId, unarchivedThumbnailItem.cacheId, @"cacheId must be equal");
    XCTAssertNotNil(unarchivedThumbnailItem.image, @"image must not be nil");
}

@end
