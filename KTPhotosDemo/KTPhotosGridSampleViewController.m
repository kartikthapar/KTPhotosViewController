//
//  KTPhotosGridSampleViewController.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosGridSampleViewController.h"

@interface KTPhotosGridSampleViewController ()

@end

@implementation KTPhotosGridSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTPhotosCollectionViewCell *cell = (KTPhotosCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    cell.photoImageView.image = [UIImage imageNamed:@"image_sample_1"];
    return cell;
}

@end
