//
//  KTPhotosThumbnailPresenting.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KTPhotoData;

/**
 * @abstract The `KTPhotosThumbnailPresenting` protocol declares methods that are used to present thumbnails.
 */
@protocol KTPhotosThumbnailPresenting <NSObject>

@required

/**
 * @abstract Update the receiver with the specified photo item.
 * @discussion The photo item provides a data source that is to be utilized to display photo contents.
 * @param photoItem The object conforming ot the `KTPhotoData` protocol.
 */
- (void)updateWithPhotoItem:(id <KTPhotoData>)photoItem;

@end
