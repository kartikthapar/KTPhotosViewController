//
//  KTPhotosThumbnailImageView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosThumbnailImageView.h"

#import "KTPhotoData.h"

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
    self.accessibilityLabel = KTPhotosThumbnailImageViewAccessibilityLabel;
    self.clipsToBounds = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

#pragma mark - Content

- (void)setPhotoItem:(id<KTPhotoData>)photoItem
{
    if ([photoItem image])
    {
        self.image = [photoItem image];
    }
    else if ([photoItem imagePath])
    {
        [self loadImageFromPath:[photoItem imagePath]];
    }
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

#pragma mark - Internal

- (void)loadImageFromPath:(NSString *)imagePath
{
    // TODO: verify image path
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    self.image = image;
}

@end
