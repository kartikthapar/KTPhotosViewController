//
//  KTPhotosGridViewController.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTPhotosCollectionView;
#import "KTPhotosCollectionViewDataSource.h"

@interface KTPhotosGridViewController : UIViewController <KTPhotosCollectionViewDataSource, UICollectionViewDelegate>

/**
 * @abstract Returns the collection view instance managed by the view controller.
 */
@property (nonatomic, strong, readonly) KTPhotosCollectionView *collectionView;

/**
 * @abstract The collection view cell identifier to use for dequeing photo view cells in the collection view for photo thumbnails.
 * @discussion The default value is the string returned by `[KTPhotoCollectionViewCell cellReuseIdentifier]`. This value must not be nil.
 * @see KTPhotoCollectionViewCell.
 */
@property (nonatomic, copy) NSString *photoCellIdentifier;

/**
 * @abstract Creates and returns a new `KTPhotosGridViewController` instance.
 * @discussion This is the designated initializer for programmatic instantiation.
 */
+ (instancetype)photosViewController;

@end
