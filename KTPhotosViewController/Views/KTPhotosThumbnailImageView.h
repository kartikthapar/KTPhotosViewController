//
//  KTPhotosThumbnailImageView.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KTPhotosThumbnailImageView : UIImageView

#pragma mark - UIAppearance

/**
 * @abstract The border color of the image view.
 * @discussion The default value is `[UIColor lightGrayColor]`
 */
@property (nonatomic) UIColor *imageViewBorderColor UI_APPEARANCE_SELECTOR;

/**
 * @abstract The border width of the image view.
 * @discussion The default value is 1.0f.
 */
@property (nonatomic) CGFloat imageViewBorderWidth UI_APPEARANCE_SELECTOR;

@end
