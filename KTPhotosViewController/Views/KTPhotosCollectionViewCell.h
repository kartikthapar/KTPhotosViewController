//
//  KTPhotosCollectionViewCell.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTPhotosThumbnailImageView;

@interface KTPhotosCollectionViewCell : UICollectionViewCell

/**
 * @abstract Returns the photo image view of the cell that is responsible for displaying the thumbnail image.
 */
@property (nonatomic, strong, readonly) KTPhotosThumbnailImageView *photoImageView;

/**
 * @abstract Returns the default string used to identify a reusable cell for photo items.
 */
+ (NSString *)cellReuseIdentifier;

@end
