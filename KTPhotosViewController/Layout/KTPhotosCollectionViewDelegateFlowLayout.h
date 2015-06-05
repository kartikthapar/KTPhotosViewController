//
//  KTPhotosCollectionViewDelegateFlowLayout.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/5/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@end
