//
//  KTPhotosThumbnailImageView.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KTPhotoData;

#define KTPhotosThumbnailImageViewAccessibilityLabel @"KTPhotosThumbnailImageViewAccessibilityLabel"

@interface KTPhotosThumbnailImageView : UIImageView

#pragma mark - Content

/**
 * @abstract The object conforming to the `KTPhotoData` protocol.
 * @discussion The object's image is to used to display in the receiver.
 */
@property (nonatomic) id <KTPhotoData> photoItem;

#pragma mark - UIAppearance

/**
 * @abstract The border color of the image view.
 * @discussion The default value is `[UIColor lightGrayColor]`
 */
@property (nonatomic) UIColor *imageViewBorderColor UI_APPEARANCE_SELECTOR;

/**
 * @abstract The border width of the image view.
 * @discussion The default value is 1.0f.
 */
@property (nonatomic) CGFloat imageViewBorderWidth UI_APPEARANCE_SELECTOR;

@end
