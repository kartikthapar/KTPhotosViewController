//
//  KTPhotosCollectionView.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotosCollectionViewDataSource.h"
@protocol KTPhotosThumbnailPresenting;

@interface KTPhotosCollectionView : UICollectionView

/**
 * @abstract The data source for the collection view.
 * @discussion The data source must conform to the `KTPhotosCollectionViewDataSource` protocol.
 */
@property (weak, nonatomic) id<KTPhotosCollectionViewDataSource> dataSource;

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
@property (nonatomic) Class sectionInfoHeaderClass;

/**
 * @abstract The section header identifier for dequeing headers in the collection view.
 * @discussion Setting this property registers the specified reuse identifier for section headers for this collection view. Setting the identifier when the view is already displayed results in undefined behavior. The default value is returned by `[KTPhotosSectionHeaderView headerReuseIdentifier]`. This value must not be `nil`.
 */
@property (nonatomic) NSString *sectionInfoHeaderIdentifier;

@end
