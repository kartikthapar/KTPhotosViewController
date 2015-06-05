//
//  KTPhotosGridViewController.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosGridViewController.h"
#import "KTPhotosCollectionView.h"
#import "KTPhotosThumbnailPresenting.h"
#import "KTPhotosSectionHeaderPresenting.h"

@interface KTPhotosGridViewController ()

@property (nonatomic, strong, readwrite) KTPhotosCollectionView *collectionView;

- (void)kt_configurePhotosViewController;

@end

@implementation KTPhotosGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // setup controller
    [self kt_configurePhotosViewController];
}

- (void)dealloc
{
    _collectionView.dataSource = nil;
    _collectionView.delegate = nil;
    _collectionView = nil;
}

+ (instancetype)photosViewController
{
    return [[[self class] alloc] init];
}

#pragma mark - config

- (void)kt_configurePhotosViewController
{
    // UICollectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[KTPhotosCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    // Appearance
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Scrolling
    self.collectionView.alwaysBounceVertical = YES;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(KTPhotosCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // get a reusable cell
    NSString *cellIdentifier = collectionView.cellIdentifier;
    UICollectionViewCell<KTPhotosThumbnailPresenting> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // update cell contents
    id <KTPhotoData> photoItem = [collectionView.dataSource collectionView:collectionView photoDataItemAtIndexPath:indexPath];
    NSParameterAssert(photoItem);
    
    [cell updateWithPhotoItem:photoItem];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(KTPhotosCollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
        // TODO: include a boolean flag indicating if section headers need to be created; can be based on indexPath also;
        // create a section header
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:collectionView.sectionInfoHeaderIdentifier forIndexPath:indexPath];
        
        if ([reusableView conformsToProtocol:@protocol(KTPhotosSectionHeaderPresenting)])
        {
            // view conforms to protocol KTPhotosSectionHeaderPresenting; so either this is an instance of KTPhotosSectionInfoHeaderView or some custom class that conforms to KTPhotosSectionHeaderPresenting
            // it is possiblethat the data source does not implement some of the data source methods
            
            // get title, this might still not be a valid string
            NSString *title = [collectionView.dataSource collectionView:collectionView titleTextForHeaderAtIndexPath:indexPath];
            if (title)
            {
                [(id<KTPhotosSectionHeaderPresenting>)reusableView updateWithTitle:title];
            }
        }
    }
    return reusableView;
}

#pragma mark - KTPhotosCollectionViewDataSource

- (id <KTPhotoData>)collectionView:(KTPhotosCollectionView *)collectionView photoDataItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return nil;
}

- (NSString *)collectionView:(KTPhotosCollectionView *)collectionView titleTextForHeaderAtIndexPath:(NSIndexPath *)indexPath
{
    // return nil so that the header view does not update
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(75, 75);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    // return the size of the header
    return CGSizeMake(collectionView.bounds.size.width, 44.0f);
}

@end
