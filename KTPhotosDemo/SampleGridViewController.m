//
//  KTPhotosGridSampleViewController.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "SampleGridViewController.h"
#import "SamplePhotosCollectionViewCell.h"
#import "SampleModelData.h"
#import "SamplePhotosSectionHeaderView.h"

@interface SampleGridViewController ()

@property (nonatomic, strong) SampleModelData *sampleModelData;

@end

@implementation SampleGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    // demonstrate use of custom cell class for collection view
//    self.collectionView.cellClass = [SamplePhotosCollectionViewCell class];
//    
//    // demonstrate use of custom cell identifier for collection view
//    self.collectionView.cellIdentifier = [SamplePhotosCollectionViewCell cellReuseIdentifier];
//    
//    // demonstrate use of custom header class for collection view
//    self.collectionView.sectionHeaderClass = [SamplePhotosSectionHeaderView class];
//    
//    // demonstrate use of custom header identifier for collection view
//    self.collectionView.sectionHeaderIdentifier = [SamplePhotosSectionHeaderView headerReuseIdentifier];
    
//    // demonstrate flow layout item/line spacing
//    KTPhotosCollectionViewFlowLayout *flowLayout = self.collectionView.collectionViewLayout;
//    flowLayout.minimumInteritemSpacing = 2.0f;
//    flowLayout.minimumLineSpacing = 5.0f;
    
    // configure data for collection view
    self.sampleModelData = [[SampleModelData alloc] init];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.sampleModelData numberOfSections];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.sampleModelData.photos.count;
}

#pragma mark - KTPhotosCollectionViewDataSource

- (id <KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView photoDataItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.sampleModelData.photos objectAtIndex:indexPath.row];
}

- (NSString *)collectionView:(KTPhotosCollectionView *)collectionView titleTextForHeaderAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Obviously";
}

- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView sizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.bounds.size.width, 50.0f);
}

#pragma mark - KTPhotosCollectionViewDelegateFlowLayout

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapRightAccessoryButton:(UIButton *)rightAccessoryButton inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section
{
    
}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapLeftAccessoryButton:(UIButton *)leftAccessoryButton inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section
{

}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapTitleLabel:(UILabel *)titleLabel inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section
{

}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView atPosition:(CGPoint)location inSection:(NSInteger)section
{

}

@end
