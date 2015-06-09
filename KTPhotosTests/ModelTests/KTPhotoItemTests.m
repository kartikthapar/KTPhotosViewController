//
//  KTPhotoItemTests.m
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

@interface KTPhotoItemTests : XCTestCase

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *cacheId;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *imageURL;

@end

@implementation KTPhotoItemTests

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

- (void)testPhotoItemInitWithImagePath
{
    KTPhotoItem *photoItem = [[KTPhotoItem alloc] initWithFilePath:self.imagePath date:self.date cacheId:self.cacheId];
    expect(photoItem).toNot.beNil();
    expect(photoItem.date).to.equal(self.date);
    expect(photoItem.cacheId).to.equal(self.cacheId);
    expect(photoItem.imagePath).to.equal(self.imagePath);
}

- (void)testPhotoItemInitWithImage
{
    KTPhotoItem *photoItem = [[KTPhotoItem alloc] initWithImage:self.image date:self.date cacheId:self.cacheId];
    expect(photoItem).toNot.beNil();
    expect(photoItem.date).to.equal(self.date);
    expect(photoItem.cacheId).to.equal(self.cacheId);
    expect(photoItem.image).to.equal(self.image);
}

- (void)testPhotoItemInitWithImageURL
{
    KTPhotoItem *photoItem = [[KTPhotoItem alloc] initWithURL:self.imageURL date:self.date cacheId:self.cacheId];
    expect(photoItem).toNot.beNil();
    expect(photoItem.date).to.equal(self.date);
    expect(photoItem.cacheId).to.equal(self.cacheId);
    expect(photoItem.imageURL).to.equal(self.imageURL);
}

- (void)testPhotoItemArchivingForImagePath
{
    KTPhotoItem *photoItem = [[KTPhotoItem alloc] initWithFilePath:self.imagePath date:self.date cacheId:self.cacheId];
 
    NSData *photoData = [NSKeyedArchiver archivedDataWithRootObject:photoItem];

    KTPhotoItem *unarchivedPhotoItem = [NSKeyedUnarchiver unarchiveObjectWithData:photoData];
    
    expect(photoItem.date).to.equal(unarchivedPhotoItem.date);
    expect(photoItem.cacheId).to.equal(unarchivedPhotoItem.cacheId);
    expect(photoItem.imagePath).to.equal(unarchivedPhotoItem.imagePath);
}

- (void)testPhotoItemArchivingForImage
{
    KTPhotoItem *photoItem = [[KTPhotoItem alloc] initWithImage:self.image date:self.date cacheId:self.cacheId];

    NSData *photoData = [NSKeyedArchiver archivedDataWithRootObject:photoItem];
    
    KTPhotoItem *unarchivedPhotoItem = [NSKeyedUnarchiver unarchiveObjectWithData:photoData];

    expect(photoItem.date).to.equal(unarchivedPhotoItem.date);
    expect(photoItem.cacheId).to.equal(unarchivedPhotoItem.cacheId);
    expect(unarchivedPhotoItem.image).toNot.beNil();
}

- (void)testPhotoItemArchivingForImageURL
{
    KTPhotoItem *photoItem = [[KTPhotoItem alloc] initWithURL:self.imageURL date:self.date cacheId:self.cacheId];
    
    NSData *photoData = [NSKeyedArchiver archivedDataWithRootObject:photoItem];
    
    KTPhotoItem *unarchivedPhotoItem = [NSKeyedUnarchiver unarchiveObjectWithData:photoData];
    
    expect(photoItem.date).to.equal(unarchivedPhotoItem.date);
    expect(photoItem.cacheId).to.equal(unarchivedPhotoItem.cacheId);
    expect(photoItem.imageURL).to.equal(unarchivedPhotoItem.imageURL);
}

@end
