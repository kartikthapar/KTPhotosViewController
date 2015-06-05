//
//  KTPhotosSectionHeaderViewTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "KIF.h"
#import "Expecta.h"
#import "XCTUtility.h"

#import "KTPhotos.h"

#import "KTTestCollectionViewModel.h"

@interface KTPhotosSectionHeaderView ()

@property UILabel *titleLabel;

@end

@interface KTPhotosSectionHeaderViewTests : XCTestCase

@property (nonatomic, strong) KTTestCollectionViewModel *testCollectionViewModel;

@end

@implementation KTPhotosSectionHeaderViewTests

- (void)setUp
{
    [super setUp];
    [self resetAppearance];
    self.testCollectionViewModel = [KTTestCollectionViewModel new];
}

- (void)tearDown
{
    XCT_DismissViewController();
    [super tearDown];
}

#pragma mark - Tests

- (void)testPhotosSectionHeaderViewInit
{
    KTPhotosSectionHeaderView *headerView = [[KTPhotosSectionHeaderView alloc] init];
    expect(headerView).toNot.beNil();
    expect([KTPhotosSectionHeaderView headerReuseIdentifier]).to.equal(NSStringFromClass([KTPhotosSectionHeaderView class]));
}

- (void)testPhotosSectionHeaderViewImplementingKTPhotosSectionHeaderPresenting
{
    KTPhotosSectionHeaderView *headerView = [KTPhotosSectionHeaderView new];
    expect([headerView conformsToProtocol:@protocol(KTPhotosSectionHeaderPresenting)]).to.equal(YES);
    expect([headerView respondsToSelector:@selector(updateWithTitle:)]).to.equal(YES);
}

- (void)testPhotosSectionHeaderViewDisplay
{
    [self presentPhotosSectionHeaderView];
    
    [tester waitForViewWithAccessibilityLabel:KTPhotosSectionHeaderViewAccessibilityLabel];
}

- (void)testPhotosSectionHeaderViewDefaultAppearance
{
    [self presentPhotosSectionHeaderView];
    
    KTPhotosSectionHeaderView *headerView = (KTPhotosSectionHeaderView *)[tester waitForViewWithAccessibilityLabel:KTPhotosSectionHeaderViewAccessibilityLabel];
    expect(headerView.titleLabelFont).to.equal([UIFont systemFontOfSize:17.0f]);
    expect(headerView.titleLabel.font).to.equal(headerView.titleLabelFont);
    
    expect(headerView.titleLabelColor).to.equal([UIColor darkGrayColor]);
    expect(headerView.titleLabel.textColor).to.equal(headerView.titleLabelColor);
    
    expect(headerView.headerBackgroundColor).to.equal([UIColor whiteColor]);
    expect(headerView.backgroundColor).to.equal(headerView.headerBackgroundColor);
}

- (void)testPhotosSectionHeaderViewCustomAppearance
{
    UIFont *titleLabelFont = [UIFont fontWithName:@"Georgia" size:24.0f];
    UIColor *titleLabelColor = [UIColor blueColor];
    UIColor *headerBackgroundColor = [UIColor redColor];
    [[KTPhotosSectionHeaderView appearance] setTitleLabelFont:titleLabelFont];
    [[KTPhotosSectionHeaderView appearance] setTitleLabelColor:titleLabelColor];
    [[KTPhotosSectionHeaderView appearance] setHeaderBackgroundColor:headerBackgroundColor];
    
    [self presentPhotosSectionHeaderView];
    
    KTPhotosSectionHeaderView *headerView = (KTPhotosSectionHeaderView *)[tester waitForViewWithAccessibilityLabel:KTPhotosSectionHeaderViewAccessibilityLabel];
    expect(headerView.titleLabelFont).to.equal(titleLabelFont);
    expect(headerView.titleLabel.font).to.equal(headerView.titleLabelFont);
    
    expect(headerView.titleLabelColor).to.equal(titleLabelColor);
    expect(headerView.titleLabel.textColor).to.equal(headerView.titleLabelColor);
    
    expect(headerView.headerBackgroundColor).to.equal(headerBackgroundColor);
    expect(headerView.backgroundColor).to.equal(headerBackgroundColor);
}

#pragma mark - Internal

- (void)presentPhotosSectionHeaderView
{
    UICollectionViewController *controller = [self.testCollectionViewModel defaultCollectionViewController];
    XCT_PresentViewController(controller);
}

- (void)resetAppearance
{
    [[KTPhotosSectionHeaderView appearance] setTitleLabelFont:[UIFont systemFontOfSize:17.0f]];
    [[KTPhotosSectionHeaderView appearance] setTitleLabelColor:[UIColor darkGrayColor]];
    [[KTPhotosSectionHeaderView appearance] setHeaderBackgroundColor:[UIColor whiteColor]];
}

@end
