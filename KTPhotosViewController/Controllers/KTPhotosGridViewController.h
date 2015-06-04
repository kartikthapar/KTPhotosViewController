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

@interface KTPhotosGridViewController : UIViewController <KTPhotosCollectionViewDataSource,
                                                          UICollectionViewDelegate,
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

@end
