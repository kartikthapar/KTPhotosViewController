//
//  KTPhotosImageCacheAgentTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/8/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "KIF.h"
#import "Expecta.h"

#import "KTPhotos.h"
#import <Haneke/Haneke.h>

@interface KTPhotosImageCacheAgent ()

- (HNKCache *)kt_cache;
- (void)kt_configureCache;

@end

@interface KTPhotosImageCacheAgentTests : XCTestCase

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *cacheKey;

@end

@implementation KTPhotosImageCacheAgentTests

- (void)setUp
{
    [super setUp];
    
    self.image = [UIImage new];
    self.cacheKey = @"1";
}

- (void)tearDown
{
    [[[KTPhotosImageCacheAgent alloc] init] removeAllImages];
    [super tearDown];
}

#pragma mark - Tests

- (void)testImageCacheAgentInit
{
    KTPhotosImageCacheAgent *agent = [[KTPhotosImageCacheAgent alloc] init];
    expect(agent).toNot.beNil();
    expect(agent).to.conformTo(@protocol(KTPhotosImageCache));
}

- (void)testImageCacheOperations
{
    KTPhotosImageCacheAgent *agent = [[KTPhotosImageCacheAgent alloc] init];
    HNKCache *cache = [agent kt_cache];
    id cacheMock = OCMPartialMock(cache);
    
    // CUD - test set image
    [agent setImage:self.image forKey:self.cacheKey];
    OCMVerify([cacheMock setImage:self.image forKey:self.cacheKey formatName:[OCMArg any]]);
    
    // CUD - test fetch image
    [agent fetchImageForKey:self.cacheKey success:^(UIImage *image){
        expect(image).toNot.beNil();
        expect(image).to.equal(self.image);
    }failure:nil];
    OCMVerify([cacheMock fetchImageForKey:self.cacheKey formatName:[OCMArg any] success:[OCMArg any] failure:[OCMArg any]]);
    
    // CUD - test remove single image
    [agent removeImageForKey:self.cacheKey];
    OCMVerify([cacheMock removeImagesForKey:self.cacheKey]);
    
    // CUD - test remove all images
    [agent setImage:self.image forKey:self.cacheKey];
    NSString *secondKey = @"2";
    [agent setImage:[UIImage new] forKey:secondKey];
    [agent removeAllImages];
    OCMVerify([cacheMock removeAllImages]);
    
    [agent fetchImageForKey:self.cacheKey success:nil failure:^(NSError *error){
        expect(error).toNot.beNil();
    }];
    [agent fetchImageForKey:secondKey success:nil failure:^(NSError *error){
        expect(error).toNot.beNil();
    }];
}

- (void)testImageCacheOverwrites
{
    KTPhotosImageCacheAgent *agent = [[KTPhotosImageCacheAgent alloc] init];
    
    [agent setImage:self.image forKey:self.cacheKey];
    
    UIImage *secondImage = [UIImage new];
    [agent setImage:secondImage forKey:self.cacheKey];
    
    [agent fetchImageForKey:self.cacheKey success:^(UIImage *image){
        expect(image).to.equal(secondImage);
        expect(image).toNot.equal(self.image);
    }failure:nil];
}

@end
