//
//  KTPhotosCollectionViewDelegateFlowLayout.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/5/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KTPhotosSectionHeaderView;

/**
 * @abstract The `KTPhotosCollectionViewDelegateFlowLayout` protocol declares methods that are used to manage layout information for the collection view.
 */
@protocol KTPhotosCollectionViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>

@required

/**
 * @abstract Asks the delegate if the specified section should stick to top.
 * @param collectionView The collection view instance requesting the information.
 * @param section The section for which the delegate has been queried.
 * @see https://github.com/Produkt/PDKTStickySectionHeadersCollectionViewLayout -> used PDKTStickySectionHeadersCollectionViewLayout for sticky headers.
 */
- (BOOL)collectionView:(KTPhotosCollectionView *)collectionView shouldStickHeaderToTopInSection:(NSUInteger)section;

/**
 * @abstract Tells the delegate that the right accessory view in the header has been tapped.
 * @param collectionView The collection view instance in which the header exists.
 * @param rightAccessoryView The right accessory view in the header.
 * @param sectionHeaderView The header view in which the accessory view exists.
 */
- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapRightAccessoryView:(UIView *)rightAccessoryView inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView;

@end