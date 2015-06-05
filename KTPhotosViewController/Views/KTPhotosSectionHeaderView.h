//
//  KTPhotosSectionHeaderView.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotosSectionHeaderPresenting.h"

#define KTPhotosSectionHeaderViewAccessibilityLabel @"KTPhotosSectionHeaderViewAccessibilityLabel"

@interface KTPhotosSectionHeaderView : UICollectionReusableView <KTPhotosSectionHeaderPresenting>

/**
 * @abstract Returns the default string used to identify a reusable header view.
 */
+ (NSString *)headerReuseIdentifier;

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

@end
