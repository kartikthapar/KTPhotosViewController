//
//  KTPhotosThumbnailImageView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosThumbnailImageView.h"

@interface KTPhotosThumbnailImageView ()

- (void)kt_configureThumbnailImageView;

@end

@implementation KTPhotosThumbnailImageView

+ (void)initialize
{
    KTPhotosThumbnailImageView *proxy = [self appearance];
    proxy.imageViewBorderWidth = 1.0f;
    proxy.imageViewBorderColor = [UIColor lightGrayColor];
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self kt_configureThumbnailImageView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self kt_configureThumbnailImageView];
    }
    return self;
}

- (void)kt_configureThumbnailImageView
{
    self.clipsToBounds = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

#pragma mark - UIAppearance

- (void)setImageViewBorderColor:(UIColor *)imageViewBorderColor
{
    self.layer.borderColor = imageViewBorderColor.CGColor;
    _imageViewBorderColor = imageViewBorderColor;
}

- (void)setImageViewBorderWidth:(CGFloat)imageViewBorderWidth
{
    self.layer.borderWidth = imageViewBorderWidth;
    _imageViewBorderWidth = imageViewBorderWidth;
}

@end
