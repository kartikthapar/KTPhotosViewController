//
//  KTPhotosCollectionViewCell.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTPhotosThumbnailImageView;

#define KTPhotosCollectionViewCellAccessibilityLabel @"KTPhotosCollectionViewCellAccessibilityLabel"

@interface KTPhotosCollectionViewCell : UICollectionViewCell

/**
 * @abstract Returns the photo image view of the cell that is responsible for displaying the thumbnail image.
 */
@property (nonatomic, strong, readonly) KTPhotosThumbnailImageView *photoImageView;

/**
 * @abstract Returns the default string used to identify a reusable cell for photo items.
 */
+ (NSString *)cellReuseIdentifier;

/**
 * @abstract The background color of the cell.
 * @discussion The default color is `[UIColor whiteColor]`.
 */
@property (nonatomic) UIColor *cellBackgroundColor UI_APPEARANCE_SELECTOR;

@end
