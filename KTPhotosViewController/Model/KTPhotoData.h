//
//  KTPhotoData.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * @abstract The `KTPhotoData` protocol declares method that `KTPhotosGridViewController` and `KTPhotosCollectionView` utilize to interface with photo model objects to display content in `KTPhotosCollectionViewCell` instances.
 */
@protocol KTPhotoData <NSObject>

@required

#pragma mark - Metadata

/**
 * @abstract The date at which the content was created. This value is used for ordering among photo model objects.
 * @discussion This value cannot be nil.
 */
- (NSDate *)date;

/**
 * @abstract The unique cache identifier for the receiver photo data. This value is used as a key for reciever photo content.
 * @discussion The cacheId value must be unique for each individual data. This value cannot be nil.
 */
- (NSString *)cacheId;

#pragma mark - Content

/**
 * @abstract The full image path for the photo data for a photo object.
 * @discussion This may return a `nil` value provided at least one of the other content APIs provide a non `nil` photo data value.
 */
- (NSString *)imagePath;

/**
 * @abstract The image data for the photo data for a photo object.
 * @discussion This may return a `nil` value provided at least one of the other content APIs provide a non `nil` photo data value.
 */
- (UIImage *)image;

/**
 * @abstract The image URL for the photo data for a photo object.
 * @discussion This may return a `nil` value provided at least one of the other content APIs provide a non `nil` photo data value. The URL must contain a valid image.
 */
- (NSURL *)imageURL;

@end
