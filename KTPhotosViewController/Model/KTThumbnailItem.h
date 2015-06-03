//
//  KTThumbnailItem.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KTPhotoData.h"

/**
 * @abstract The `KTThumbnailItem` is a concrete class for photo objects that represents a thumbnail image.
 * @discussion It implements the `KTPhotoData` protocol containing basic metadata and content data source information for a particular thumbnail image.
 */
@interface KTThumbnailItem : NSObject <KTPhotoData, NSCoding>

#pragma mark - KTPhotoData

/**
 * @abstract Returns the data on which the content was created.
 */
@property (nonatomic, copy, readonly) NSDate *date;

/**
 * @abstract Returns the cache idetnfier that unique identifies the image in the cache.
 */
@property (nonatomic, copy, readwrite) NSString *cacheId;

/**
 * @abstract Returns the image path for the thumbnail image represented by the receiver object.
 * @discussion If this value is `nil`, see other image content APIs.
 * @see `image`;
 */
@property (nonatomic, copy, readonly) NSString *imagePath;

/**
 * @abstract Returns the original thumbnail image represented by the receiver object.
 * @discussion If this value is `nil`, see other image content APIs.
 * @see `imagePath`.
 */
@property (nonatomic, copy, readonly) UIImage *image;

#pragma mark - init

/**
 * @abstract Initializes and returns an object with the specified image path, date and cacheId.
 * @discussion This is typically used when the image path is available.
 * @param imagePath The image path of the thumbnail. This value must not be `nil`.
 * @param cacheId The unique cache identifier used for caching the image. This value must not be `nil`.
 */
+ (instancetype)thumbnailWithImagePath:(NSString *)imagePath cacheId:(NSString *)cacheId;

/**
 * @abstract Initializes and returns an object with the specified image path and cacheId.
 * @discussion This is typically used when the image path is available.
 * @param imagePath The image path of the thumbnail. This value must not be `nil`.
 * @param date The date on which the content was created. This value must not be `nil`.
 * @param cacheId The unique cache identifier used for caching the image. This value must not be `nil`.
 */
- (instancetype)initWithImagePath:(NSString *)imagePath  date:(NSDate *)date cacheId:(NSString *)cacheId;

/**
 * @abstract Initializes and returns an object with the specified image, date and cacheId.
 * @discussion This is typically used when the image is available.
 * @param image The thumbnail image. This value must not be `nil`.
 * @param cacheId The unique cache identifier used for caching the image. This value must not be `nil`.
 */
+ (instancetype)thumbnailWithImage:(UIImage *)image cacheId:(NSString *)cacheId;

/**
 * @abstract Initializes and returns an object with the specified image and cacheId.
 * @discussion This is typically used when the image path is available.
 * @param image The thumbnail image. This value must not be `nil`.
 * @param date The date on which the content was created. This value must not be `nil`.
 * @param cacheId The unique cache identifier used for caching the image. This value must not be `nil`.
 */
- (instancetype)initWithImage:(UIImage *)image date:(NSDate *)date cacheId:(NSString *)cacheId;

@end
