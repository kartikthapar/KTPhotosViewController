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

/**
 * @abstract The `KTPhotosThumbnailLoading` protocol declares methods that are used to ascertain the status of image loading in a thumbnail image view like `KTPhotosThumbnailImageView`.
 * @discussion Currently, `KTPhotosCollectionViewCell` implements the `KTPhotosThumbnailLoading` protocol to display activity status of a loading thumbnail from a URL or other source.
 */
@protocol KTPhotosThumbnailLoading <NSObject>

/**
 * @abstract Tells the delegate that the enclosed image was loaded with progress.
 * @discussion This is used to show progress related to image loading for the image in the image view.
 * @param progress The progress for the image.
 */
- (void)didLoadImageWithProgress:(CGFloat)progress;

/**
 * @abstract Tells the delegate that the image has just started loading from the source.
 * @discussion The delegate method is only called when image is loaded from a source path or URL.
 */
- (void)didStartLoadingImage;

/**
 * @abstract Tells the delegate that the closed image was loaded already.
 */
- (void)didFinishLoadingImage;

@end

@interface KTPhotosThumbnailImageView : UIImageView

#pragma mark - Content

/**
 * @abstract The object conforming to the `KTPhotoData` protocol.
 * @discussion The object's image is to used to display in the receiver.
 */
@property (nonatomic) id <KTPhotoData> photoItem;

/**
 * @abstract The delegate for the `KTPhotosThumbnailLoading` protocol.
 */
@property (nonatomic, assign) id<KTPhotosThumbnailLoading> delegate;

#pragma mark - UIAppearance

/**
 * @abstract The border color of the image view.
 * @discussion The default value is the default value of UIImageView's border color.
 */
@property (nonatomic) UIColor *imageViewBorderColor UI_APPEARANCE_SELECTOR;

/**
 * @abstract The border width of the image view.
 * @discussion The default value is the default value of UIImageView's border width.
 */
@property (nonatomic) CGFloat imageViewBorderWidth UI_APPEARANCE_SELECTOR;

@end
