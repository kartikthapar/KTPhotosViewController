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

- (void)kt_loadImageFromPath:(NSString *)path;
- (void)kt_loadImageFromURL:(NSURL *)url;

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
    _photoItem = photoItem;
    if ([photoItem image])
    {
        self.image = [photoItem image];
    }
    else if ([photoItem imagePath])
    {
        [self kt_loadImageFromPath:[photoItem imagePath]];
    }
    else if ([photoItem imageURL])
    {
        [self kt_loadImageFromURL:[photoItem imageURL]];
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

- (void)kt_loadImageFromPath:(NSString *)path
{
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    self.image = image;
}

- (void)kt_loadImageFromURL:(NSURL *)url
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.photoItem imageURL] && [[self.photoItem imageURL] isEqual:url])
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.5 animations:^{
                        self.image = image;
                        self.alpha = 1.0;
                    }];
                }];
            }
        });
    });
}

@end
