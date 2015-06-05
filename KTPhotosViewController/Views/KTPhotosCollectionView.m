//
//  KTPhotosCollectionView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosCollectionView.h"
#import "KTPhotosCollectionViewCell.h"
#import "KTPhotosSectionHeaderView.h"

#import <objc/runtime.h>

@interface KTPhotosCollectionViewCell ()

- (void)kt_configureCollectionView;

@end

@implementation KTPhotosCollectionView

@dynamic dataSource;
@dynamic delegate;
@dynamic collectionViewLayout;

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout])
    {
        [self kt_configureCollectionView];
    }
    return self;
}

- (void)kt_configureCollectionView
{
    self.backgroundColor = [UIColor whiteColor];
    self.bounces = YES;
    self.alwaysBounceVertical = YES;
    
    _cellClass = [KTPhotosCollectionViewCell class];
    _cellIdentifier = [KTPhotosCollectionViewCell cellReuseIdentifier];
    
    _sectionHeaderClass = [KTPhotosSectionHeaderView class];
    _sectionHeaderIdentifier = [KTPhotosSectionHeaderView headerReuseIdentifier];
    
    [self registerClass:self.cellClass forCellWithReuseIdentifier:self.cellIdentifier];
    [self registerClass:self.sectionHeaderClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:self.sectionHeaderIdentifier];
}

#pragma mark - Config

- (void)setCellClass:(Class<KTPhotosThumbnailPresenting>)cellClass
{
    NSParameterAssert(cellClass);
    
    if (!class_conformsToProtocol(cellClass, @protocol(KTPhotosThumbnailPresenting)))
    {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Cell class must conform to KTPhotosThumbnailPresenting protocol" userInfo:nil];
    }
    
    _cellClass = cellClass;
    [self registerClass:_cellClass forCellWithReuseIdentifier:_cellIdentifier];
}

- (void)setCellIdentifier:(NSString *)cellIdentifier
{
    NSParameterAssert(cellIdentifier);
    
    _cellIdentifier = cellIdentifier;
    [self registerClass:_cellClass forCellWithReuseIdentifier:cellIdentifier];
}

- (void)setSectionHeaderClass:(Class)sectionHeaderClass
{
    NSParameterAssert(sectionHeaderClass);
    
    _sectionHeaderClass = sectionHeaderClass;
    [self registerClass:_sectionHeaderClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:_sectionHeaderIdentifier];
}

- (void)setSectionHeaderIdentifier:(NSString *)sectionHeaderIdentifier
{
    NSParameterAssert(sectionHeaderIdentifier);

    _sectionHeaderIdentifier = sectionHeaderIdentifier;
    [self registerClass:_sectionHeaderClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:_sectionHeaderIdentifier];
}

@end
