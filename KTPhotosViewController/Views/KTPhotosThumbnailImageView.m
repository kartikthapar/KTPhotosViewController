//
//  KTPhotosThumbnailImageView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosThumbnailImageView.h"

#import "KTPhotosImageCache.h"
#import "KTPhotosImageCacheProxy.h"
#import "KTPhotoData.h"

@interface KTPhotosThumbnailImageView ()

- (void)kt_configureThumbnailImageView;

- (void)kt_loadImage:(UIImage *)image cacheId:(NSString *)cacheId;
- (void)kt_loadImageFromPath:(NSString *)path cacheId:(NSString *)cacheId;
- (void)kt_loadImageFromURL:(NSURL *)url cacheId:(NSString *)cacheId;

@end

@implementation KTPhotosThumbnailImageView

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
    
    NSString *cacheId = [photoItem cacheId];
    id<KTPhotosImageCache> agent = [[KTPhotosImageCacheProxy sharedProxy] imageCacheAgent];
    
    [agent fetchImageForKey:cacheId success:^(UIImage *image){
        self.image = image;
    }failure:^(NSError *error){
        if ([photoItem image])
        {
            [self kt_loadImage:[photoItem image] cacheId:cacheId];
        }
        else if ([photoItem imagePath])
        {
            [self kt_loadImageFromPath:[photoItem imagePath] cacheId:cacheId];
        }
        else if ([photoItem imageURL])
        {
            [self kt_loadImageFromURL:[photoItem imageURL] cacheId:cacheId];
        }
    }];
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

- (void)kt_loadImage:(UIImage *)image cacheId:(NSString *)cacheId
{
    id <KTPhotosImageCache> imageCacheAgent = [[KTPhotosImageCacheProxy sharedProxy] imageCacheAgent];
    [imageCacheAgent setImage:image forKey:cacheId];
    self.image = image;
}

- (void)kt_loadImageFromPath:(NSString *)path cacheId:(NSString *)cacheId
{
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    id <KTPhotosImageCache> imageCacheAgent = [[KTPhotosImageCacheProxy sharedProxy] imageCacheAgent];
    [imageCacheAgent setImage:image forKey:cacheId];
    self.image = image;
}

- (void)kt_loadImageFromURL:(NSURL *)url cacheId:(NSString *)cacheId
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        id <KTPhotosImageCache> imageCacheAgent = [[KTPhotosImageCacheProxy sharedProxy] imageCacheAgent];
        [imageCacheAgent setImage:image forKey:cacheId];
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
