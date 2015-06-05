//
//  KTPhotosSectionInfoHeaderView.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotosSectionHeaderPresenting.h"

#define KTPhotosSectionInfoHeaderViewAccessibilityLabel @"KTPhotosSectionInfoHeaderViewAccessibilityLabel"

@interface KTPhotosSectionInfoHeaderView : UICollectionReusableView <KTPhotosSectionHeaderPresenting>

/**
 * @abstract Returns the default string used to identify a reusable header view.
 */
+ (NSString *)headerReuseIdentifier;

@end
