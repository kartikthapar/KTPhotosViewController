//
//  SamplePhotosCollectionViewCell.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/3/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotos.h"

#define SampleCollectionViewCellAccessibilityLabel @"SampleCollectionViewCellAccessibilityLabel"

@interface SamplePhotosCollectionViewCell : UICollectionViewCell <KTPhotosThumbnailPresenting>

@property (nonatomic, readonly) UIImageView *imageView;

+ (NSString *)cellReuseIdentifier;

@end
