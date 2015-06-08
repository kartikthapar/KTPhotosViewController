//
//  KTPhotosImageCacheAgent.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/7/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosImageCacheAgent.h"

#import <Haneke/Haneke.h>

#define kDefaultImageCacheFormatName @"kDefaultImageCacheFormatName"

@interface KTPhotosImageCacheAgent ()

- (HNKCache *)kt_cache;
- (void)kt_configureCache;

@end

@implementation KTPhotosImageCacheAgent

#pragma mark - init

- (instancetype)init
{
    if (self = [super init])
    {
        [self kt_configureCache];
    }
    return self;
}

#pragma mark - Cache Operations

- (void)fetchImageForKey:(NSString *)key success:(void (^)(UIImage *image))successBlock failure:(void (^)(NSError *error))failureBlock;
{
    HNKCache *cache = [self kt_cache];
    [cache fetchImageForKey:key formatName:kDefaultImageCacheFormatName success:successBlock failure:failureBlock];
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    HNKCache *cache = [self kt_cache];
    [cache setImage:image forKey:key formatName:kDefaultImageCacheFormatName];
}

- (void)removeImageForKey:(NSString *)key
{
    HNKCache *cache = [self kt_cache];
    [cache removeImagesForKey:key];
}

- (void)removeAllImages
{
    HNKCache *cache = [self kt_cache];
    [cache removeAllImages];
}

#pragma mark - Internal

- (HNKCache *)kt_cache
{
    HNKCache *sharedCache = [HNKCache sharedCache];
    return sharedCache;
}

- (void)kt_configureCache
{
    HNKCacheFormat *format = [[HNKCacheFormat alloc] initWithName:kDefaultImageCacheFormatName];
    [[self kt_cache] registerFormat:format];
}

@end
