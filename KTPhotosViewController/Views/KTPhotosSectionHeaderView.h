//
//  KTPhotosSectionHeaderView.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotosSectionHeaderPresenting.h"

@class KTPhotosSectionHeaderView;

#define KTPhotosSectionHeaderViewAccessibilityLabel @"KTPhotosSectionHeaderViewAccessibilityLabel"

@protocol KTphotosSectionHeaderDelegate <NSObject>

/**
 * @abstract Tells the delegate that the right accessory button was tapped.
 * @param sectionHeaderView The section header in which the right accessory button exists.
 */
- (void)sectionHeaderDidTapRightAccessoryButton:(KTPhotosSectionHeaderView *)sectionHeaderView;

/**
 * @abstract Tells the delegate that the left accessory button was tapped.
 * @param sectionHeaderView The section header in which the left accessory button exists.
 */
- (void)sectionHeaderDidTapLeftAccessoryButton:(KTPhotosSectionHeaderView *)sectionHeaderView;

@end

@interface KTPhotosSectionHeaderView : UICollectionReusableView <KTPhotosSectionHeaderPresenting>

/**
 * @abstract Returns the default string used to identify a reusable header view.
 */
+ (NSString *)headerReuseIdentifier;

/**
 * @abstract Returns the left accessory button for the header view.
 */
@property (nonatomic, strong, readonly) UIButton *leftAccessoryButton;

/**
 * @abstract Returns the right accessory button for the header view.
 */
@property (nonatomic, strong, readonly) UIButton *rightAccessoryButton;

/**
 * @abstract The delegate for the header view.
 */
@property (nonatomic, assign) id<KTphotosSectionHeaderDelegate> delegate;

#pragma mark - UIAppearance

/**
 * @abstract The font for the title label displayed in the header view.
 */
@property (nonatomic) UIFont *titleLabelFont UI_APPEARANCE_SELECTOR;

/**
 * @abstract The text color for the title label displayed in the header view.
 */
@property (nonatomic) UIColor *titleLabelColor UI_APPEARANCE_SELECTOR;

/**
 * @abstract The background color for the header view.
 */
@property (nonatomic) UIColor *headerBackgroundColor UI_APPEARANCE_SELECTOR;

/**
 * @abstract The background color for the right accessory button.
 * @discussion The default value is `[UIColor grayColor]`.
 */
@property (nonatomic) UIColor *rightAccessoryBackgroundColor UI_APPEARANCE_SELECTOR;

/**
 * @abstract The background color for the left accessory button.
 * @discussion The default value is `[UIColor grayColor]`.
 */
@property (nonatomic) UIColor *leftAccessoryBackgroundColor UI_APPEARANCE_SELECTOR;

@end
