//
//  KTPhotosCollectionView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosCollectionView.h"
#import "KTPhotosCollectionViewCell.h"

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
    
    NSString *photoCellIdentifier = [KTPhotosCollectionViewCell cellReuseIdentifier];
    [self registerClass:[KTPhotosCollectionViewCell class] forCellWithReuseIdentifier:photoCellIdentifier];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self kt_configureCollectionView];
}

@end
