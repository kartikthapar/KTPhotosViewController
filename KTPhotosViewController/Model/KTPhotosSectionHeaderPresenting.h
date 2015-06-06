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

@required

@property (nonatomic, assign) NSInteger sectionIndex;

@optional

/**
 * @abstract Update the header with the specified title.
 * @param title The title string for the header view.
 */
- (void)updateWithTitle:(NSString *)title;

/**
 * @abstract Update the header with the specified subtitle.
 * @param subtitle The subtitle string for the header view.
 */
- (void)updateWithSubtitle:(NSString *)subtitle;

@end
