//
//  KTPhotosSectionHeaderPresenting.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/5/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @abstract The `KTPhotosSectionHeaderPresenting` protocol declares methods that are used to present thumbnails.
 * @discussion The `KTPhotosSectionHeaderView` implements the `KTPhotosSectionHeaderPresenting` to update contents of a header view. You can provide your own header class to present header views and not implement the `KTPhotosSectionHeaderPresenting` protocol. However, if you wish to provide similar content, then subclassing `KTPhotosSectionHeaderView` is the way to go.
 */
@protocol KTPhotosSectionHeaderPresenting <NSObject>

@optional

/**
 * @abstract The index for the section in which the header currently exists.
 */
@property (nonatomic, assign) NSInteger sectionIndex;

/**
 * @abstract Update the header with the specified title.
 * @param title The title string for the header view.
 */
- (void)updateWithTitle:(NSString *)title;

/**
 * @abstract Display the left accessory in the header view.
 */
- (void)showLeftAccessory;

@end
