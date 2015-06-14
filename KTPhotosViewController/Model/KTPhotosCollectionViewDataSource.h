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
 * @abstract Asks the data source for the thumbnail data corresponding to the specified index path in the collection view.
 * @discussion This method must not return `nil`.
 * @param collectionView The collection view instance requesting the information.
 * @param indexPath The index path that specifies the location of the item.
 * @return An object corresponding to the `KTPhotoData` protocol.
 */
- (id<KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView thumbnailDataItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 * @abstract Asks the data source for the photo data corresponding to the specified index path in the collection view.
 * @discussion This method must not return `nil`.
 * @param collectionView The collection view instance requesting the information.
 * @param indexPath The index path that specifies the location of the item.
 * @return An object corresponding to the `KTPhotoData` protocol.
 */
- (id<KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView photoDataItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 * @abstract Asks the data source for all the photo that is to be displayed in the collection view.
 * @discussion This is used to populate the photo browser.
 * @param collectionView The collection view instance requesting the information.
 */
- (NSArray *)photoDataForCollectionView:(KTPhotosCollectionView *)collectionView;

@optional

/**
 * @abstract The title text for the section header displayed in the collection view.
 * @discussion The default value returned is nil.
 * @param collectionView The collection view instance requesting the information.
 * @param section The integer section value for which the collection view has requested information.
 * @return An `NSString` with the title for the header.
 */
- (NSString *)collectionView:(KTPhotosCollectionView *)collectionView titleTextForHeaderInSection:(NSInteger)section;

/**
 * @abstract The size for the section header displayed in the collection view.
 * @discussion The default value is given by `KTPhotosCollectionViewDefaultSectionHeaderHeight`.
 * @param collectionView The collection view instance request the information.
 * @param section The integer section value for which the collection view has requested information.
 * @return The `CGSize` for the header.
 */
- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView sizeForHeaderInSection:(NSInteger)section;

@end
