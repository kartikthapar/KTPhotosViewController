//
//  KTPhotosCollectionView.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotosCollectionViewDataSource.h"
#import "KTPhotosCollectionViewFlowLayout.h"
#import "KTPhotosCollectionViewDelegateFlowLayout.h"

@protocol KTPhotosThumbnailPresenting;

#define KTPhotosCollectionViewDefaultSectionHeaderSize CGSizeMake([UIScreen mainScreen].bounds.size.width, 44.0f)

@interface KTPhotosCollectionView : UICollectionView

/**
 * @abstract The data source for the collection view.
 * @discussion The data source must conform to the `KTPhotosCollectionViewDataSource` protocol.
 */
@property (weak, nonatomic) id<KTPhotosCollectionViewDataSource> dataSource;

/**
 * @abstract The delegate for the collection view.
 * @discussion The delegate must confor to the `KTPhotosCollectionViewDelegateFlowLayout` protocol.
 */
@property (weak, nonatomic) id<KTPhotosCollectionViewDelegateFlowLayout> delegate;

/**
 * @abstract The collection view layout for the collection view.
 */
@property (nonatomic, strong) KTPhotosCollectionViewFlowLayout *collectionViewLayout;

/**
 * @abstract The `UICollectionViewCell` subclass for customizing the presentation of thumbnails in the collection view.
 * @discussion `KTPhotosCollectionViewCell` provides various APIs for presenting limited content on the cell. If you wish to provide your own custom class, you must conform to the 'KTPhotosThumbnailPresenting` protocol. Setting this property registers the class for cells for this collection view. Setting the class when the view is already displayed results in undefined behavior. The default value is returned by `[KTPhotosCollectionViewCell class]`. This value must not be `nil`.
 */
@property (nonatomic) Class <KTPhotosThumbnailPresenting> cellClass;

/**
 * @abstract The cell identifier for dequeing cells in the collection view.
 * @discussion Setting this property registers the specified reuse identifier for cells for this collection view. Setting the identifier when the view is already displayed results in undefined behavior. The default value is returned by `[KTPhotosCollectionViewCell cellReuseIdentifier]`. This value must not be `nil`.
 */
@property (nonatomic) NSString *cellIdentifier;

/**
 * @abstract The `UICollectionReusableView` subclass for customizing the presentation of section headers in the collection view.
 * @discussion Setting this property registers the class for headers for this collection view. Setting the class when the view is already displayed results in undefined behavior. The default value is returned by `[KTPhotosSectionHeaderView class]`. This value must not be `nil`.
 */
@property (nonatomic) Class sectionHeaderClass;

/**
 * @abstract The section header identifier for dequeing headers in the collection view.
 * @discussion Setting this property registers the specified reuse identifier for section headers for this collection view. Setting the identifier when the view is already displayed results in undefined behavior. The default value is returned by `[KTPhotosSectionHeaderView headerReuseIdentifier]`. This value must not be `nil`.
 */
@property (nonatomic) NSString *sectionHeaderIdentifier;

@end
