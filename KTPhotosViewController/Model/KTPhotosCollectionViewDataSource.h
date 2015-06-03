//
//  KTPhotosCollectionViewDataSource.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KTPhotoData;
@class KTPhotosCollectionView;

@protocol KTPhotosCollectionViewDataSource <UICollectionViewDataSource>

/**
 * @abstract Asks the data source for the photo data corresponding to the specified index path in the collection view.
 * @discussion This method must not return `nil`.
 * @param collectionView The collection view instance request the information.
 * @param indexPath The index path that specifies the location of the item.
 * @return An object corresponding ot the `KTPhotoData` protocol.
 */
- (id <KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView photoDataItemAtIndexPath:(NSIndexPath *)indexPath;

@end
