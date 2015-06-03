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

#import "KTPhotos.h"

@interface KTPhotosThumbnailImageView ()

- (void)kt_configureThumbnailImageView;

@end

@interface KTPhotosThumbnailImageViewTests : XCTestCase

@end

@implementation KTPhotosThumbnailImageViewTests

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    [self dismiss];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Tests

- (void)testPhotosThumbnailImageViewInit
{
    KTPhotosThumbnailImageView *photoImageView = [[KTPhotosThumbnailImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    XCTAssertNotNil(photoImageView, @"photoImageView cannot be nil");
}

- (void)testPhotosThumbnailImageViewAppearanceDefaultProperties
{
    [self presentThumbnailImageView];
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
    
    [self presentThumbnailImageView];
    
    KTPhotosThumbnailImageView *photoImageView = (KTPhotosThumbnailImageView *)[tester waitForViewWithAccessibilityLabel:KTPhotosThumbnailImageViewAccessibilityLabel];
    expect(photoImageView.imageViewBorderColor).to.equal(imageViewBorderColor);
    expect(photoImageView.imageViewBorderWidth).to.equal(imageViewBorderWidth);
}

#pragma mark - Internal

- (void)presentThumbnailImageView
{
    // create a view controller
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = [UIColor whiteColor];
    
    // add photo image view
    KTPhotosThumbnailImageView *photoImageView = [[KTPhotosThumbnailImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [controller.view addSubview:photoImageView];
    
    // present this view controller
    UINavigationController *presentingController = [[UINavigationController alloc] initWithRootViewController:controller];
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController presentViewController:presentingController animated:YES completion:nil];
}

- (void)dismiss
{
    UINavigationController *navigationController = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
