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

#pragma mark - KTPhotosCollectionViewCell

/**
 * @abstract Tells the delegate that collection view cell was tapped.
 * @discussion This methods is only called if the position is not within the bounds of auxiliary views in the cell.
 * @param collectionView The collection view instance notifying the delegate of the tap event.
 * @param indexPath The index path of the cell that was tapped.
 * @param location The location of the tap event in the cell.
 */
- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapCellAtIndexPath:(NSIndexPath *)indexPath atPosition:(CGPoint)location;

#pragma mark - KTPhotosSectionHeaderView

/**
 * @abstract Asks the delegate if the specified section should stick to top.
 * @param collectionView The collection view instance notifying the delegate of the tap event.
 * @param section The section for which the delegate has been queried.
 * @see https://github.com/Produkt/PDKTStickySectionHeadersCollectionViewLayout -> used PDKTStickySectionHeadersCollectionViewLayout for sticky headers.
 */
- (BOOL)collectionView:(KTPhotosCollectionView *)collectionView shouldStickHeaderToTopInSection:(NSUInteger)section;

/**
 * @abstract Tells the delegate that the right accessory button in the header has been tapped.
 * @param collectionView The collection view instance notifying the delegate of the tap event.
 * @param rightAccessoryButton The right accessory button in the header.
 * @param sectionHeaderView The header view in which the accessory button exists.
 * @param section The section index for the header view.
 */
- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapRightAccessoryButton:(UIButton *)rightAccessoryButton inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section;

/**
 * @abstract Tells the delegate that the left accessory button in the header has been tapped.
 * @param collectionView The collection view instance notifying the delegate of the tap event.
 * @param leftAccessoryButton The left accessory button in the header.
 * @param sectionHeaderView The header view in which the accessory button exists.
 * @param section The section index for the header view.
 */
- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapLeftAccessoryButton:(UIButton *)leftAccessoryButton inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section;

/**
 * @abstract Tells the delegate that the title label in the header has been tapped.
 * @param collectionView The collection view instance notifying the delegate of the tap event.
 * @param titleLabel The title label in the header.
 * @param sectionHeaderView The header view in which the accessory button exists.
 * @param section The section index for the header view.
 */
- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapTitleLabel:(UILabel *)titleLabel inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section;

/**
 * @abstract Tells the delegate that the section headerhas been tapped.
 * @discussion This methods is only called if the position is not within the bounds of the auxiliary views like titleLabel, accessory buttons, etc.
 * @param collectionView The collection view instance notifying the delegate of the tap event.
 * @param titleLabel The title label in the header.
 * @param location The location of the tap event in the header view.
 * @param section The section index for the header view.
 */
- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView atPosition:(CGPoint)location inSection:(NSInteger)section;

@end
