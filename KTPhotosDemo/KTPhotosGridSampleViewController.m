//
//  KTPhotosGridSampleViewController.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosGridSampleViewController.h"
#import "SampleModelData.h"

@interface KTPhotosGridSampleViewController ()

@property (nonatomic, strong) SampleModelData *sampleModelData;

@end

@implementation KTPhotosGridSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sampleModelData = [[SampleModelData alloc] init];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 200;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.sampleModelData.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTPhotosCollectionViewCell *cell = (KTPhotosCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    return cell;
}

#pragma mark - KTPhotosCollectionViewDataSource

- (id <KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView photoDataItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.sampleModelData.photos objectAtIndex:indexPath.row];
}

@end
