//
//  KTPhotosGridViewController.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosGridViewController.h"
#import "KTPhotosCollectionView.h"
#import "KTPhotosCollectionViewFlowLayout.h"
#import "KTPhotosThumbnailPresenting.h"
#import "KTPhotosSectionHeaderPresenting.h"
#import "KTPhotosImageCacheProxy.h"

#import "KTPhotoData.h"
#import "KTPhotosImageCache.h"
#import "KTPhotosCollectionViewCell.h"
#import "KTPhotosSectionHeaderView.h"

#import <IDMPhotoBrowser/IDMPhotoBrowser.h>

#define kCellSizeDefault 93

@interface KTPhotosGridViewController ()

@property (nonatomic, strong, readwrite) KTPhotosCollectionView *collectionView;
@property (nonatomic, strong, readwrite) KTPhotosImageCacheProxy *imageCacheProxy;

- (void)kt_configurePhotosViewController;
- (void)kt_loadPhotoBrowserForCollectionView:(KTPhotosCollectionView *)collectionView withSelectedIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)kt_getPhotoIndexForIndexPath:(NSIndexPath *)indexPath inCollectionView:(KTPhotosCollectionView *)collectionView;

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
    KTPhotosCollectionViewFlowLayout *flowLayout = [[KTPhotosCollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[KTPhotosCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    // Scrolling
    self.collectionView.alwaysBounceVertical = YES;
    
    // Cache
    self.imageCacheProxy = [KTPhotosImageCacheProxy sharedProxy];
    
//    [[self.imageCacheProxy imageCacheAgent] setImage:[UIImage imageNamed:@"image_sample_1"] forKey:@"cacheId"];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(KTPhotosCollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(KTPhotosCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(KTPhotosCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // get a reusable cell
    NSString *cellIdentifier = collectionView.cellIdentifier;
    UICollectionViewCell<KTPhotosThumbnailPresenting> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // set the delegate if possible
    if ([cell respondsToSelector:@selector(delegate)])
    {
        [cell setValue:collectionView forKey:NSStringFromSelector(@selector(delegate))];
    }
    
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
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:collectionView.sectionHeaderIdentifier forIndexPath:indexPath];
        
        UICollectionReusableView<KTPhotosSectionHeaderPresenting> *headerView = (UICollectionReusableView<KTPhotosSectionHeaderPresenting> *)reusableView;
        
        if ([reusableView conformsToProtocol:@protocol(KTPhotosSectionHeaderPresenting)])
        {
            // set the section for the header view (for gestures, etc)
            if ([headerView respondsToSelector:@selector(sectionIndex)])
            {
                [headerView setSectionIndex:indexPath.section];
            }
            
            // set the delegate if the header view responds to the delegate property
            if ([headerView respondsToSelector:@selector(delegate)])
            {
                [headerView setValue:collectionView forKey:NSStringFromSelector(@selector(delegate))];
            }
            
            // view conforms to protocol KTPhotosSectionHeaderPresenting; so either this is an instance of KTPhotosSectionHeaderView or some custom class that conforms to KTPhotosSectionHeaderPresenting
            // it is possiblethat the data source does not implement some of the data source methods
            
            // get title, this might still not be a valid string
            NSString *title = [collectionView.dataSource collectionView:collectionView titleTextForHeaderAtIndexPath:indexPath];
            if (title)
            {
                if ([headerView respondsToSelector:@selector(updateWithTitle:)])
                {
                    [headerView updateWithTitle:title];
                }
            }
            
            if ([headerView respondsToSelector:@selector(showLeftAccessoryButton)])
            {
                [headerView showLeftAccessoryButton];
            }
            
            if ([headerView respondsToSelector:@selector(showRightAccessoryButton)])
            {
                [headerView showRightAccessoryButton];
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

- (NSArray *)photoDataForCollectionView:(KTPhotosCollectionView *)collectionView
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return nil;
}

- (NSString *)collectionView:(KTPhotosCollectionView *)collectionView titleTextForHeaderAtIndexPath:(NSIndexPath *)indexPath
{
    // return nil so that the header view does not update
    return nil;
}

- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView sizeForHeaderInSection:(NSInteger)section
{
    // return the default value
    return KTPhotosCollectionViewDefaultSectionHeaderSize;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(kCellSizeDefault, kCellSizeDefault);
}

- (CGSize)collectionView:(KTPhotosCollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    // return the size of the header
    return [collectionView.dataSource collectionView:collectionView sizeForHeaderInSection:section];
}

#pragma mark - KTPhotosCollectionViewDelegateFlowLayout

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapCellAtIndexPath:(NSIndexPath *)indexPath atPosition:(CGPoint)location
{
    [self kt_loadPhotoBrowserForCollectionView:collectionView withSelectedIndexPath:indexPath];
}

- (BOOL)collectionView:(KTPhotosCollectionView *)collectionView shouldStickHeaderToTopInSection:(NSUInteger)section
{
    // stick all headers
    return YES;
}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapRightAccessoryButton:(UIButton *)rightAccessoryButton inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return;
}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapLeftAccessoryButton:(UIButton *)leftAccessoryButton inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return;
}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapTitleLabel:(UILabel *)titleLabel inSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView inSection:(NSInteger)section
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return;
}

- (void)collectionView:(KTPhotosCollectionView *)collectionView didTapSectionHeader:(KTPhotosSectionHeaderView *)sectionHeaderView atPosition:(CGPoint)location inSection:(NSInteger)section
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return;
}

#pragma mark - Internal

- (void)kt_loadPhotoBrowserForCollectionView:(KTPhotosCollectionView *)collectionView withSelectedIndexPath:(NSIndexPath *)indexPath
{
    // get all the photo data to display in the photo browser
    NSArray *allPhotoData = [self photoDataForCollectionView:collectionView];
    
    // create a list of IDMPhoto objects
    NSMutableArray *photos = [NSMutableArray array];
    for (NSInteger index = 0; index < allPhotoData.count; index++)
    {
        id<KTPhotoData> photoData = allPhotoData[index];
        IDMPhoto *photo;
        if ([photoData image])
        {
            photo = [IDMPhoto photoWithImage:[photoData image]];
        }
        else if ([photoData imagePath])
        {
            photo = [IDMPhoto photoWithFilePath:[photoData imagePath]];
        }
        else if ([photoData imageURL])
        {
            photo = [IDMPhoto photoWithURL:[photoData imageURL]];
        }
        
        [photos addObject:photo];
    }
    
    // create photo browser with all the photos
    IDMPhotoBrowser *browser = [[IDMPhotoBrowser alloc] initWithPhotos:photos];
    
    // set the initial page index for the photo browser based on the tapped cell (see-indexPath)
    NSInteger index = [self kt_getPhotoIndexForIndexPath:indexPath inCollectionView:collectionView];
    [browser setInitialPageIndex:index];
    
    // configure browser
    browser.displayCounterLabel = YES;
    browser.displayActionButton = NO;
    
    // show
    [self presentViewController:browser animated:YES completion:nil];
}

- (NSInteger)kt_getPhotoIndexForIndexPath:(NSIndexPath *)indexPath inCollectionView:(KTPhotosCollectionView *)collectionView
{
    // set the initial value of the photo index to be 0
    NSInteger photoIndex = 0;
    
    NSInteger tapSection = indexPath.section;
    if (tapSection == 0)
    {
        // if section == 0, just return the row
        return indexPath.row;
    }
    else
    {
        // go to all the sections before the current section
        for (NSInteger section = 0; section < tapSection; section++)
        {
            photoIndex += [collectionView numberOfItemsInSection:section];
        }
        
        // once done throw all the sections, add the current item index
        photoIndex += indexPath.row;
    }
    
    return photoIndex;
}

@end
