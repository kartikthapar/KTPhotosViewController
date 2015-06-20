//
//  KTPhotosGridViewController.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotosCollectionViewDataSource.h"
#import "KTPhotosCollectionViewDelegateFlowLayout.h"

@class KTPhotosImageCacheProxy;
@class KTPhotosCollectionView;

@interface KTPhotosGridViewController : UIViewController <KTPhotosCollectionViewDataSource,
                                                          KTPhotosCollectionViewDelegateFlowLayout,
                                                          UICollectionViewDelegateFlowLayout>

/**
 * @abstract Creates and returns a new `KTPhotosGridViewController` instance.
 * @discussion This is the designated initializer for programmatic instantiation.
 */
+ (instancetype)photosViewController;

/**
 * @abstract Returns the collection view instance managed by the view controller.
 */
@property (nonatomic, strong, readonly) KTPhotosCollectionView *collectionView;

/**
 * @abstract Returns the image cache proxy managed by the view controller; responsible for handling cache agents.
 */
@property (nonatomic, strong, readonly) KTPhotosImageCacheProxy *imageCacheProxy;

#pragma mark - Appearance

/**
 * @abstract The tint color for the progress view for an image displayed in the photo browser.
 * @discussion The default value is `self.view.tintColor` OR `self.collectionView.tintColor`.
 */
@property (nonatomic) UIColor *imageProgressTintColor;

/**
 * @abstract The tint color for the progress view track for an image displayed in the photo browser.
 * @discussion The default value is `[UIColor colorWithWhite:0.9 alpha:1]`.
 */
@property (nonatomic) UIColor *imageProgressTrackColor;

/**
 * @abstract The exact number of photos in a single row. In a grid reference, this refers to the number of columns.
 * @discussion The default is value is 4. Changing the value after the view has already been displayed results in undefined behavior.
 * // TODO: throw exception.
 */
@property (nonatomic) NSInteger numberOfPhotosPerRow;

/**
 * @abstract The photo browser animation for displaying the single image view.
 * @discussion The default animation is a fade-in animation over 3 seconds.
 */
@property (nonatomic, strong) CATransition *photoBrowserAnimation;

@end
