//
//  KTPhotosThumbnailImageViewTests.m
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
#import "XCTUtility.h"

#import "KTPhotos.h"

@interface KTPhotosThumbnailImageView ()

- (void)kt_configureThumbnailImageView;

- (void)kt_loadImage:(UIImage *)image cacheId:(NSString *)cacheId;
- (void)kt_loadImageFromPath:(NSString *)path cacheId:(NSString *)cacheId;
- (void)kt_loadImageFromURL:(NSURL *)url cacheId:(NSString *)cacheId;

@end

@interface KTPhotosThumbnailImageViewTests : XCTestCase

@property (nonatomic, strong) NSString *cacheId;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSURL *imageURL;

@end

@implementation KTPhotosThumbnailImageViewTests

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    
    self.cacheId = @"cacheId";
    self.image = [UIImage imageNamed:@"image_sample_1"];
    self.imagePath = [[NSBundle mainBundle] pathForResource:@"image_sample_1" ofType:@"jpeg"];
    self.imageURL = [NSURL URLWithString:@"http://lorempixel.com/400/400"];
}

- (void)tearDown
{
    XCT_DismissViewController();
    [self resetAppearance];
    [super tearDown];
}

#pragma mark - KTPhotosThumbnailImageView Properties

- (void)testPhotosThumbnailImageViewInit
{
    KTPhotosThumbnailImageView *photoImageView = [[KTPhotosThumbnailImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    expect(photoImageView).toNot.beNil();
}

- (void)testPhotosThumbnailImageViewAppearanceDefaultProperties
{
    [self presentThumbnailImageView:nil];
    KTPhotosThumbnailImageView *photoImageView = (KTPhotosThumbnailImageView *)[tester waitForViewWithAccessibilityLabel:KTPhotosThumbnailImageViewAccessibilityLabel];
    expect(photoImageView.imageViewBorderColor).to.equal([UIColor lightGrayColor]);
    expect(photoImageView.imageViewBorderWidth).to.equal(1.0f);
}

- (void)testPhotosThumbnailImageViewAppearanceProperties
{
    UIColor *imageViewBorderColor = [UIColor redColor];
    CGFloat imageViewBorderWidth = 10.0f;
    
    [[KTPhotosThumbnailImageView appearance] setImageViewBorderColor:imageViewBorderColor];
    [[KTPhotosThumbnailImageView appearance] setImageViewBorderWidth:imageViewBorderWidth];
    
    [self presentThumbnailImageView:nil];
    
    KTPhotosThumbnailImageView *photoImageView = (KTPhotosThumbnailImageView *)[tester waitForViewWithAccessibilityLabel:KTPhotosThumbnailImageViewAccessibilityLabel];
    expect(photoImageView.imageViewBorderColor).to.equal(imageViewBorderColor);
    expect(photoImageView.imageViewBorderWidth).to.equal(imageViewBorderWidth);
}

#pragma mark - KTPhotosThumbnailImageView photoItem

- (void)testPhotosThumbnailImageViewLoadedWithImage
{
    // Create a photo image view with the specified image loaded using the image API
    // Load image view on tester and see if check if the photo is valid
    
    KTPhotosThumbnailImageView *photoImageView = [[KTPhotosThumbnailImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    KTThumbnailItem *thumbnailItem = [KTThumbnailItem thumbnailWithImage:self.image cacheId:self.cacheId];
    photoImageView.photoItem = thumbnailItem;
    
    [self presentThumbnailImageView:photoImageView];
    
    KTPhotosThumbnailImageView *displayedImageView = (KTPhotosThumbnailImageView *)[tester waitForViewWithAccessibilityLabel:KTPhotosThumbnailImageViewAccessibilityLabel];
    expect(displayedImageView.image).toNot.beNil();
}

- (void)testPhotosThumbnailImageViewLoadedWithImagePath
{
    // Create a photo image view with the specified image loaded using the imagePath API
    // Load image view on tester and see if check if the photo is valid

    KTPhotosThumbnailImageView *photoImageView = [[KTPhotosThumbnailImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    KTThumbnailItem *thumbnailItem = [KTThumbnailItem thumbnailWithImagePath:self.imagePath cacheId:self.cacheId];
    photoImageView.photoItem = thumbnailItem;

    [self presentThumbnailImageView:photoImageView];

    KTPhotosThumbnailImageView *displayedImageView = (KTPhotosThumbnailImageView *)[tester waitForViewWithAccessibilityLabel:KTPhotosThumbnailImageViewAccessibilityLabel];
    expect(displayedImageView.image).toNot.beNil();
}

- (void)testPhotosThumbnailImageViewLoadedWithImageURL
{
    // Create a photo image view with the specified image loaded using the imageURL API
    // Load image view on tester and see if check if the photo is valid

    KTPhotosThumbnailImageView *photoImageView = [[KTPhotosThumbnailImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    KTThumbnailItem *thumbnailItem = [KTThumbnailItem thumbnailWithURL:self.imageURL cacheId:self.cacheId];
    photoImageView.photoItem = thumbnailItem;
    
    [self presentThumbnailImageView:photoImageView];
    
    // wait for 1.0f for loading the image from URL/animation, etc
    [tester waitForTimeInterval:1.0f];
    
    // wait for animations to finish, maybe compensated in wait before, but its ok
    [tester waitForAnimationsToFinishWithTimeout:1.0f];
    KTPhotosThumbnailImageView *displayedImageView = (KTPhotosThumbnailImageView *)[tester waitForViewWithAccessibilityLabel:KTPhotosThumbnailImageViewAccessibilityLabel];
    expect(displayedImageView.image).toNot.beNil();
}

#pragma mark - Internal

- (void)presentThumbnailImageView:(KTPhotosThumbnailImageView *)photoImageView
{
    // create a view controller
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = [UIColor whiteColor];
    
    // add photo image view
    if (!photoImageView)
    {
        photoImageView = [[KTPhotosThumbnailImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    }
    [controller.view addSubview:photoImageView];
    
    XCT_PresentViewController(controller);
}

- (void)resetAppearance
{
    [[KTPhotosThumbnailImageView appearance] setImageViewBorderColor:[UIColor lightGrayColor]];
    [[KTPhotosThumbnailImageView appearance] setImageViewBorderWidth:1.0f];
}

@end
