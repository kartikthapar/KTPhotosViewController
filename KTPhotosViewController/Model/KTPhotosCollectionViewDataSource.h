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
 * @param collectionView The collection view instance requesting the information.
 * @param indexPath The index path that specifies the location of the item.
 * @return An object corresponding ot the `KTPhotoData` protocol.
 */
- (id <KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView photoDataItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

/**
 * @abstract The title text for the section header displayed in the collection view.
 * @discussion The default value returned is nil.
 * @param collectionView The collection view instance requesting the information.
 * @param indexPath The index path that specifies the location of the item.
 * @return An `NSString` with the title for the header.
 */
- (NSString *)collectionView:(KTPhotosCollectionView *)collectionView titleTextForHeaderAtIndexPath:(NSIndexPath *)indexPath;

/**
 * @abstract The subtitle text for the section header displayed in the collection view.
 * @discussion The default value returned is nil.
 * @param collectionView The collection view instance requesting the information.
 * @param indexPath The index path that specifies the location of the item.
 * @return An `NSString` with the subtitle for the header.
 */
- (NSString *)collectionView:(KTPhotosCollectionView *)collectionView subtitleTextForHeaderAtIndexPath:(NSIndexPath *)indexPath;

/**
 * @abstract The size for the section header displayed in the collection view.
 * @discussion The default value is given by `KTPhotosCollectionViewDefaultSectionHeaderHeight`.
 * @param collectionView The collection view instance request the information.
 * @param section The integer section value for which the collection view has requested information.
 * @return The `CGSize` for the header.
 */
- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView sizeForHeaderInSection:(NSInteger)section;

@end
