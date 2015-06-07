//
//  KTPhotosCollectionViewCell.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotosThumbnailPresenting.h"

@class KTPhotosCollectionViewCell;
@class KTPhotosThumbnailImageView;

#define KTPhotosCollectionViewCellAccessibilityLabel @"KTPhotosCollectionViewCellAccessibilityLabel"

/**
 * @abstract The `KTPhotosCollectionViewCellDelegate` protocol defines methods for user interactions with the collection view cell.
 */
@protocol KTPhotosCollectionViewCellDelegate <NSObject>

@required

/**
 * @abstract Tells the delegate that the cell was tapped at the specified position.
 * @discussion This methods is only called if the position is not within the bounds of auxiliary views in the cell.
 * @param cell The cell that was tapped.
 * @param location The point at which cell was tapped.
 */
- (void)photosCollectionViewCellDidTapCell:(KTPhotosCollectionViewCell *)cell atPosition:(CGPoint)location;

@end

/**
 * @abstract The `KTPhotosCollectionViewCell` class provides a basic foundation for the representation of photo data item in a collection view.
 * @discussion This is the default `cellClass` for `KTPhotosCollectionView` and can be used as it is. You may subclass this class or provide a completely different implementation of your cell.
 */
@interface KTPhotosCollectionViewCell : UICollectionViewCell <KTPhotosThumbnailPresenting>

/**
 * @abstract Returns the photo image view of the cell that is responsible for displaying the thumbnail image.
 */
@property (nonatomic, strong, readonly) KTPhotosThumbnailImageView *photoImageView;

/**
 * @abstract Returns the default string used to identify a reusable cell for photo items.
 */
+ (NSString *)cellReuseIdentifier;

/**
 * @abstract The delegate for the collection view cell.
 */
@property (nonatomic, assign) id<KTPhotosCollectionViewCellDelegate> delegate;

#pragma mark - Appearance

/**
 * @abstract The background color of the cell.
 * @discussion The default color is `[UIColor whiteColor]`.
 */
@property (nonatomic) UIColor *cellBackgroundColor UI_APPEARANCE_SELECTOR;

@end
