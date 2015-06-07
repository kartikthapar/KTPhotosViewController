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
@property UILabel *subtitleLabel;
@property UIVisualEffectView *blurView;
@property UIView *rightAccessoryView;
@property UITapGestureRecognizer *tapGestureRecognizer;

- (void)kt_configureSectionHeaderView;
- (void)kt_configureConstraintsForBlurView;
- (void)kt_configureConstraintsForTitleLabel;
- (void)kt_configureConstraintsForSubtitleLabel;
- (void)kt_configureConstraintsForRightAccessoryView;
- (void)kt_handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;

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
    expect(headerView.rightAccessoryView).toNot.beNil();
    expect(headerView).toNot.beNil();
    expect([KTPhotosSectionHeaderView headerReuseIdentifier]).to.equal(NSStringFromClass([KTPhotosSectionHeaderView class]));
}

- (void)testPhotosSectionHeaderViewImplementingKTPhotosSectionHeaderPresenting
{
    KTPhotosSectionHeaderView *headerView = [KTPhotosSectionHeaderView new];
    expect([headerView conformsToProtocol:@protocol(KTPhotosSectionHeaderPresenting)]).to.equal(YES);
    expect([headerView respondsToSelector:@selector(updateWithTitle:)]).to.equal(YES);
    expect([headerView respondsToSelector:@selector(updateWithSubtitle:)]).to.equal(YES);
    expect([headerView respondsToSelector:@selector(sectionIndex)]).to.equal(YES);
}

- (void)testPhotosSectionHeaderViewDisplay
{
    [self presentPhotosSectionHeaderView];
    
    KTPhotosSectionHeaderView *headerView = (KTPhotosSectionHeaderView *)[tester waitForViewWithAccessibilityLabel:KTPhotosSectionHeaderViewAccessibilityLabel];
    expect(headerView.titleLabel).toNot.beNil();
    expect(headerView.subtitleLabel).toNot.beNil();
    expect(headerView.blurView).toNot.beNil();
    expect(headerView.rightAccessoryView).toNot.beNil();
}

- (void)testPhotosSectionHeaderViewDefaultAppearance
{
    [self presentPhotosSectionHeaderView];
    
    KTPhotosSectionHeaderView *headerView = (KTPhotosSectionHeaderView *)[tester waitForViewWithAccessibilityLabel:KTPhotosSectionHeaderViewAccessibilityLabel];
    expect(headerView.titleLabelFont).to.equal([UIFont systemFontOfSize:17.0f]);
    expect(headerView.titleLabel.font).to.equal(headerView.titleLabelFont);
    
    expect(headerView.titleLabelColor).to.equal([UIColor darkGrayColor]);
    expect(headerView.titleLabel.textColor).to.equal(headerView.titleLabelColor);
    
    expect(headerView.subtitleLabelFont).to.equal([UIFont systemFontOfSize:14.0f]);
    expect(headerView.subtitleLabel.font).to.equal(headerView.subtitleLabelFont);

    expect(headerView.subtitleLabelColor).to.equal([UIColor lightGrayColor]);
    expect(headerView.subtitleLabel.textColor).to.equal(headerView.subtitleLabelColor);

    expect(headerView.headerBackgroundColor).to.equal([UIColor clearColor]);
    expect(headerView.backgroundColor).to.equal(headerView.headerBackgroundColor);
    
    expect(headerView.rightAccessoryBackgroundColor).to.equal([UIColor grayColor]);
    expect(headerView.rightAccessoryView.backgroundColor).to.equal(headerView.rightAccessoryView.backgroundColor);
}

- (void)testPhotosSectionHeaderViewCustomAppearance
{
    UIFont *titleLabelFont = [UIFont fontWithName:@"Georgia" size:24.0f];
    UIColor *titleLabelColor = [UIColor blueColor];
    UIFont *subtitleLabelFont = [UIFont fontWithName:@"Georgia" size:12.0f];
    UIColor *subtitleLabelColor = [UIColor greenColor];
    UIColor *headerBackgroundColor = [UIColor redColor];
    UIColor *rightAccessoryBackgroundColor = [UIColor blueColor];
    
    [[KTPhotosSectionHeaderView appearance] setTitleLabelFont:titleLabelFont];
    [[KTPhotosSectionHeaderView appearance] setTitleLabelColor:titleLabelColor];
    [[KTPhotosSectionHeaderView appearance] setSubtitleLabelFont:subtitleLabelFont];
    [[KTPhotosSectionHeaderView appearance] setSubtitleLabelColor:subtitleLabelColor];
    [[KTPhotosSectionHeaderView appearance] setHeaderBackgroundColor:headerBackgroundColor];
    [[KTPhotosSectionHeaderView appearance] setRightAccessoryBackgroundColor:rightAccessoryBackgroundColor];
    
    [self presentPhotosSectionHeaderView];
    
    KTPhotosSectionHeaderView *headerView = (KTPhotosSectionHeaderView *)[tester waitForViewWithAccessibilityLabel:KTPhotosSectionHeaderViewAccessibilityLabel];
    expect(headerView.titleLabelFont).to.equal(titleLabelFont);
    expect(headerView.titleLabel.font).to.equal(headerView.titleLabelFont);
    
    expect(headerView.titleLabelColor).to.equal(titleLabelColor);
    expect(headerView.titleLabel.textColor).to.equal(headerView.titleLabelColor);
    
    expect(headerView.subtitleLabelFont).to.equal(subtitleLabelFont);
    expect(headerView.subtitleLabel.font).to.equal(headerView.subtitleLabelFont);
    
    expect(headerView.subtitleLabelColor).to.equal(subtitleLabelColor);
    expect(headerView.subtitleLabel.textColor).to.equal(headerView.subtitleLabelColor);
    
    expect(headerView.headerBackgroundColor).to.equal(headerBackgroundColor);
    expect(headerView.backgroundColor).to.equal(headerBackgroundColor);
    
    expect(headerView.rightAccessoryBackgroundColor).to.equal(rightAccessoryBackgroundColor);
    expect(headerView.rightAccessoryView.backgroundColor).to.equal(rightAccessoryBackgroundColor);
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
    [[KTPhotosSectionHeaderView appearance] setSubtitleLabelFont:[UIFont systemFontOfSize:14.0f]];
    [[KTPhotosSectionHeaderView appearance] setSubtitleLabelColor:[UIColor lightGrayColor]];
    [[KTPhotosSectionHeaderView appearance] setHeaderBackgroundColor:[UIColor clearColor]];
    [[KTPhotosSectionHeaderView appearance] setRightAccessoryBackgroundColor:[UIColor grayColor]];
}

@end
