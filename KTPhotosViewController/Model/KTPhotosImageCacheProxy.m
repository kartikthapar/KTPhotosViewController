//
//  KTPhotosImageCacheProxy.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/7/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosImageCacheProxy.h"
#import "KTPhotosImageCacheAgent.h"

@interface KTPhotosImageCacheProxy ()

@property (nonatomic, strong) KTPhotosImageCacheAgent *defaultCacheAgent;
@property (nonatomic, strong) id<KTPhotosImageCache> cacheAgent;

- (void)kt_resetCache;
- (KTPhotosImageCacheAgent *)kt_defaultAgent;

@end

@implementation KTPhotosImageCacheProxy

#pragma mark - init

+ (instancetype)sharedProxy
{
    static KTPhotosImageCacheProxy *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        // create the default cache agent
        self.defaultCacheAgent = [self kt_defaultAgent];
        self.cacheAgent = self.defaultCacheAgent;
    }
    return self;
}

#pragma mark - Cache Agent

- (id<KTPhotosImageCache>)imageCacheAgent
{
    return self.cacheAgent;
}

- (id<KTPhotosImageCache>)defaultImageCacheAgent
{
    return self.defaultCacheAgent;
}

- (void)registerImageCacheAgent:(id<KTPhotosImageCache>)agent
{
    [self unregisterImageCacheAgent];
    self.cacheAgent = agent;
}

- (void)unregisterImageCacheAgent
{
    [self kt_resetCache];
}

#pragma mark - Internal

- (void)kt_resetCache
{
    // remove all images for the cache agent
    [self.cacheAgent removeAllImages];
    
    // if the default cache agent was the cache agent
    if (self.cacheAgent == self.defaultCacheAgent || [self.cacheAgent class] == [KTPhotosImageCacheAgent class])
    {
        self.cacheAgent = nil;
        self.defaultCacheAgent = nil;
    }
    
    // in any case, get a new default cache agent
    KTPhotosImageCacheAgent *newAgent = [self kt_defaultAgent];
    self.defaultCacheAgent = newAgent;
    self.cacheAgent = self.defaultCacheAgent;
}

- (KTPhotosImageCacheAgent *)kt_defaultAgent
{
    KTPhotosImageCacheAgent *defaultCacheAgent = [[KTPhotosImageCacheAgent alloc] init];
    return defaultCacheAgent;
}

@end
