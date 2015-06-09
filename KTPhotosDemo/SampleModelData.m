//
//  SampleModelData.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "SampleModelData.h"

@interface SampleModelData ()

@property (nonatomic, strong, readwrite) NSMutableArray *thumbnails;
@property (nonatomic, strong, readwrite) NSMutableArray *photos;

- (void)loadSampleThumbnails;
- (void)loadSamplePhotos;

@end

@implementation SampleModelData

- (instancetype)init
{
    if (self = [super init])
    {
        self.thumbnails = [NSMutableArray array];
        self.photos = [NSMutableArray array];
        [self loadSampleThumbnails];
        [self loadSamplePhotos];
    }
    return self;
}

#pragma mark - Config

- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return 40;
}

#pragma mark - Internal

- (void)loadSampleThumbnails
{
    NSBundle *thumbnailsBundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"Thumbnails" withExtension:@"bundle"]];
    NSInteger totalThumbnails = 40;
    for (NSInteger index = 1; index <= totalThumbnails; index++)
    {
        NSString *imageName = [NSString stringWithFormat:@"1200-%ld_t", index];
        NSString *imagePath = [thumbnailsBundle pathForResource:imageName ofType:@"jpeg"];
        KTThumbnailItem *thumbnailItem = [KTThumbnailItem thumbnailWithImagePath:imagePath cacheId:imageName];
        [self.thumbnails addObject:thumbnailItem];
    }
}

- (void)loadSamplePhotos
{
    NSBundle *photosBundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"Photos" withExtension:@"bundle"]];
    NSInteger totalPhotos = 40;
    for (NSInteger index = 1; index <= totalPhotos; index++)
    {
        NSString *imageName = [NSString stringWithFormat:@"1200-%ld", index];
        NSString *imagePath = [photosBundle pathForResource:imageName ofType:@"jpeg"];
        KTThumbnailItem *thumbnailItem = [KTThumbnailItem thumbnailWithImagePath:imagePath cacheId:imageName];
        [self.photos addObject:thumbnailItem];
    }
}

@end
