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

@end
