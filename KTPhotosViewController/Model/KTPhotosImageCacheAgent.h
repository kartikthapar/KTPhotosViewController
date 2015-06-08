//
//  KTPhotosImageCacheAgent.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/7/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KTPhotosImageCache.h"

/**
 * @abstract The `KTPhotosImageCacheAgent` is the base default class that deals with all cache operations.
 * @discussion `KTPhotosImageCacheAgent` conforms to the `KTPhotosImageCache` protocol API to allow different entities to use perform basic cache operations. This class uses the Haneke image cache framework (https://github.com/Haneke/Haneke) for the most basic cache implementation for photos. You may subclass this class to include further functionality based off of Haneke cache. To implement your own cache agent, implement the `KTPhotosImageCache` protocol and register your class with the `KTPhotosImageCacheProxy` manager.
 */
@interface KTPhotosImageCacheAgent : NSObject <KTPhotosImageCache>

@end
