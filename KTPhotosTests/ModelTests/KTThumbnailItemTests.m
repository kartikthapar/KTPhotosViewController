//
//  KTThumbnailItemTests.m
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

@interface KTThumbnailItemTests : XCTestCase

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *cacheId;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *imageURL;

@end

@implementation KTThumbnailItemTests

- (void)setUp
{
    [super setUp];
    self.date = [NSDate date];
    self.cacheId = @"cacheId";
    self.imagePath = @"image_path";
    self.image = [UIImage new];
    self.imageURL = [NSURL URLWithString:@"http://lorempixel.com/400/400/"];
}

- (void)tearDown
{
    self.date = nil;
    self.cacheId = nil;
    self.imagePath = nil;
    self.image = nil;
    self.imageURL = nil;
    [super tearDown];
}

#pragma mark - Tests

- (void)testThumbnailItemInitWithImagePath
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImagePath:self.imagePath date:self.date cacheId:self.cacheId];
    expect(thumbnailItem).toNot.beNil();
    expect(thumbnailItem.date).to.equal(self.date);
    expect(thumbnailItem.cacheId).to.equal(self.cacheId);
    expect(thumbnailItem.imagePath).to.equal(self.imagePath);
}

- (void)testThumbnailItemInitWithImage
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImage:self.image date:self.date cacheId:self.cacheId];
    expect(thumbnailItem).toNot.beNil();
    expect(thumbnailItem.date).to.equal(self.date);
    expect(thumbnailItem.cacheId).to.equal(self.cacheId);
    expect(thumbnailItem.image).to.equal(self.image);
}

- (void)testThumbnailItemInitWithImageURL
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImageURL:self.imageURL date:self.date cacheId:self.cacheId];
    expect(thumbnailItem).toNot.beNil();
    expect(thumbnailItem.date).to.equal(self.date);
    expect(thumbnailItem.cacheId).to.equal(self.cacheId);
    expect(thumbnailItem.imageURL).to.equal(self.imageURL);
}

- (void)testThumbnailItemArchivingForImagePath
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImagePath:self.imagePath date:self.date cacheId:self.cacheId];
 
    NSData *thumbnailData = [NSKeyedArchiver archivedDataWithRootObject:thumbnailItem];

    KTThumbnailItem *unarchivedThumbnailItem = [NSKeyedUnarchiver unarchiveObjectWithData:thumbnailData];
    
    expect(thumbnailItem.date).to.equal(unarchivedThumbnailItem.date);
    expect(thumbnailItem.cacheId).to.equal(unarchivedThumbnailItem.cacheId);
    expect(thumbnailItem.imagePath).to.equal(unarchivedThumbnailItem.imagePath);
}

- (void)testThumbnailItemArchivingForImage
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImage:self.image date:self.date cacheId:self.cacheId];

    NSData *thumbnailData = [NSKeyedArchiver archivedDataWithRootObject:thumbnailItem];
    
    KTThumbnailItem *unarchivedThumbnailItem = [NSKeyedUnarchiver unarchiveObjectWithData:thumbnailData];

    expect(thumbnailItem.date).to.equal(unarchivedThumbnailItem.date);
    expect(thumbnailItem.cacheId).to.equal(unarchivedThumbnailItem.cacheId);
    expect(unarchivedThumbnailItem.image).toNot.beNil();
}

- (void)testThumbnailItemArchivingForImageURL
{
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImageURL:self.imageURL date:self.date cacheId:self.cacheId];
    
    NSData *thumbnailData = [NSKeyedArchiver archivedDataWithRootObject:thumbnailItem];
    
    KTThumbnailItem *unarchivedThumbnailItem = [NSKeyedUnarchiver unarchiveObjectWithData:thumbnailData];
    
    expect(thumbnailItem.date).to.equal(unarchivedThumbnailItem.date);
    expect(thumbnailItem.cacheId).to.equal(unarchivedThumbnailItem.cacheId);
    expect(thumbnailItem.imageURL).to.equal(unarchivedThumbnailItem.imageURL);
}

@end
