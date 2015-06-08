//
//  KTPhotosImageCache.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/7/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * @abstract `KTPhotosImageCache` defines methods used for cache operations.
 */
@protocol KTPhotosImageCache <NSObject>

@required

/**
 * @abstract Retrieves an image from the cache.
 * @param key The cache identifier for the image.
 * @param successBlock Block that is called with the requested image from the cache. The success block is executed synchronously if the image exists in memory cache; otherwise it will be executed asynchronously.
 * @see failureBlock Block that is called if the image is not in the cache or if there is an issue retrieving it. The failure block is executed asynchronously on the main thread.
 */
- (void)fetchImageForKey:(NSString *)key success:(void (^)(UIImage *image))successBlock failure:(void (^)(NSError *error))failureBlock;

/**
 * @abstract Set image for the specified key.
 * @param image The image that is to be added to the cache.
 * @param key The cache identifier for the image.
 */
- (void)setImage:(UIImage *)image forKey:(NSString *)key;

/**
 * @abstract Removes image for the specified key.
 * @param key The cache identifier for the image.
 */
- (void)removeImageForKey:(NSString *)key;

/**
 * @abstract Removes all images from cache.
 */
- (void)removeAllImages;

@optional

/**
 * @abstract Returns a <Key, Value> <=> <cacheId, image> collection of images.
 */
- (NSDictionary *)allImages;

@end
