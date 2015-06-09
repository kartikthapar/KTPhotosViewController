//
//  SampleModelData.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "SampleModelData.h"

@implementation SampleModelData

- (instancetype)init
{
    if (self = [super init])
    {
        [self loadPhotos];
    }
    return self;
}

#pragma mark - Config

- (void)loadPhotos
{
    UIImage *image = [UIImage imageNamed:@"image_sample_1"];
    NSString *cacheId = @"cacheId";
    NSDate *date = [NSDate date];
    
    self.photos = [NSMutableArray array];
    
    KTThumbnailItem *thumbnailItem = [[KTThumbnailItem alloc] initWithImage:image date:date cacheId:cacheId];
    
    for (int i = 0; i < 8; i++)
    {
        [self.photos addObject:thumbnailItem];
    }
}

- (NSInteger)numberOfSections
{
    return 1;
}

@end
