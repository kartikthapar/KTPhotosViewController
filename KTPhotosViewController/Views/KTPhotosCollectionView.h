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
 * @abstract The `UICollectionViewCell` subclass for customizing the presentation of thumbnails in a collection view.
 * @discussion `KTPhotosCollectionViewCell` provides various APIs for presenting limited content on the cell. If you wish to provide your own custom class, you must conform to the 'KTPhotosThumbnailPresenting` protocol. Setting this property registers the class for cells for this collection view. Setting the class when the view is already displayed results in undefined behavior. The default value is returned by `[KTPhotoCollectionViewCell class]`. This value must not be `nil`.
 */
@property (nonatomic) Class <KTPhotosThumbnailPresenting> cellClass;

/**
 * @abstract The cell identifier for dequeing cells in the collection view.
 * @discussion Setting this property registers the class for cells for this collection view. Setting this property registers the class for cells for this collection view. Setting the class when the view is already displayed results in undefined behavior. The default value is returned by `[KTPhotoCollectionViewCell cellReuseIdentifier]`. This value must not be `nil`.
 */
@property (nonatomic) NSString *cellIdentifier;

@end
