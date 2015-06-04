//
//  KTPhotosCollectionView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosCollectionView.h"
#import "KTPhotosCollectionViewCell.h"

#import <objc/runtime.h>

@interface KTPhotosCollectionViewCell ()

- (void)kt_configureCollectionView;

@end

@implementation KTPhotosCollectionView

@dynamic dataSource;

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
    
    _cellIdentifier = [KTPhotosCollectionViewCell cellReuseIdentifier];
    _cellClass = [KTPhotosCollectionViewCell class];
    
    [self registerClass:_cellClass forCellWithReuseIdentifier:_cellIdentifier];
}

#pragma mark - Config

- (void)setCellClass:(Class<KTPhotosThumbnailPresenting>)cellClass
{
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

@end
