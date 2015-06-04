//
//  KTPhotoDataTests.m
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

@interface KTPhotosSamplePhotoItem : NSObject <KTPhotoData>

@property (nonatomic, readonly) NSString *cacheId;
@property (nonatomic, strong) NSString *imagePath;

@end

@implementation KTPhotosSamplePhotoItem

- (UIImage *)image
{
    return nil;
}

- (NSURL *)imageURL
{
    return nil;
}

- (NSDate *)date
{
    return [NSDate date];
}

@end

@interface KTPhotoDataTests : XCTestCase

@end

@implementation KTPhotoDataTests

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

- (void)testPhotoSamplePhotoItemInit
{
    KTPhotosSamplePhotoItem *photoItem = [[KTPhotosSamplePhotoItem alloc] init];
    expect(photoItem).toNot.beNil();
    
    NSString *cacheId = [photoItem cacheId];
    expect(cacheId).to.beNil; //set internally
    
    photoItem.imagePath = @"image_path";
    expect([photoItem imagePath]).toNot.beNil();
}

@end
