//
//  KTTestCollectionViewModel.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTTestCollectionViewModel.h"

#import <UIKit/UIKit.h>

#import "KTPhotos.h"

@interface KTTestCollectionViewModel () <KTPhotosCollectionViewDataSource, KTPhotosCollectionViewDelegateFlowLayout, UICollectionViewDelegateFlowLayout>

@end

@implementation KTTestCollectionViewModel

#pragma mark - UICollectionViewController

- (UICollectionViewController *)defaultCollectionViewController
{
    UICollectionViewController *controller = [self collectionViewController:[self defaultCollectionView]];

    [self registerClasses:controller.collectionView];
        
    return controller;
}

- (UICollectionViewController *)collectionViewController:(UICollectionView *)collectionView
{
    UICollectionViewController *controller = [[UICollectionViewController alloc] initWithCollectionViewLayout:nil];
    controller.collectionView = collectionView;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    return controller;
}

#pragma mark - UICollectionView

- (KTPhotosCollectionView *)defaultCollectionView
{
    KTPhotosCollectionViewFlowLayout *layout = [KTPhotosCollectionViewFlowLayout new];
    KTPhotosCollectionView *collectionView = [[KTPhotosCollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    return collectionView;
}

#pragma mark - Internal

- (UICollectionViewFlowLayout *)flowLayout
{
    // create flow layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return flowLayout;
}

- (void)registerClasses:(UICollectionView *)collectionView
{
    [collectionView registerClass:[KTPhotosCollectionViewCell class] forCellWithReuseIdentifier:[KTPhotosCollectionViewCell cellReuseIdentifier]];
    [collectionView registerClass:[KTPhotosSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[KTPhotosSectionHeaderView headerReuseIdentifier]];
}

#pragma mark - KTPhotosCollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(KTPhotosCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:collectionView.cellIdentifier forIndexPath:indexPath];
}

- (UICollectionReusableView *)collectionView:(KTPhotosCollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:collectionView.sectionHeaderIdentifier forIndexPath:indexPath];
    }
    return view;
}

- (id <KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView photoDataItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTThumbnailItem *item = [[KTThumbnailItem alloc] initWithImage:[UIImage new] date:[NSDate date] cacheId:@"cacheId"];
    return item;
}

- (NSString *)collectionView:(KTPhotosCollectionView *)collectionView titleTextForHeaderAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Title";
}

- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView sizeForHeaderInSection:(NSInteger)section
{
    // return the default value
    return CGSizeMake(collectionView.bounds.size.width, 56.0f);
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(75, 75);
}

- (UIEdgeInsets)collectionView:(KTPhotosCollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    // return the size of the header
    return [collectionView.dataSource collectionView:collectionView sizeForHeaderInSection:section];
}

#pragma mark - KTPhotosCollectionViewDelegateFlowLayout

- (BOOL)collectionView:(KTPhotosCollectionView *)collectionView shouldStickHeaderToTopInSection:(NSUInteger)section
{
    return YES;
}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapRightAccessoryButton:(UIButton *)rightAccessoryButton inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView
{
    
}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapLeftAccessoryButton:(UIButton *)leftAccessoryButton inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView
{
    
}

@end
