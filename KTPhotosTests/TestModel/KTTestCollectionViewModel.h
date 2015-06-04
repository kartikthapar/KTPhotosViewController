//
//  KTTestCollectionViewModel.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KTPhotosCollectionView;

/**
 * @abstract Defines a sample collection view model for test.
 */
@interface KTTestCollectionViewModel : NSObject

#pragma mark - UICollectionViewController

/**
 * @abstract Initializes, configures and returns a default collection view controller using the various base classes in `KTPhotos`.
 */
- (UICollectionViewController *)defaultCollectionViewController;

/**
 * @abstract Initializes a collection view controller with the specified collection view and returns it.
 */
- (UICollectionViewController *)collectionViewController:(UICollectionView *)collectionView;

#pragma mark - UICollectionView

/**
 * @abstract Returns the default collection view using the various base classes in `KTPhotos`.
 */
- (KTPhotosCollectionView *)defaultCollectionView;

@end
