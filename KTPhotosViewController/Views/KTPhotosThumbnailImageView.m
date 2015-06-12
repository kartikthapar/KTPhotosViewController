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

#import <AFNetworking/AFNetworking.h>

@interface KTPhotosThumbnailImageView ()

- (void)kt_configureThumbnailImageView;

/**
 * @abstract Load image from the specified image.
 * @discussion Only called when cache loading fails.
 */
- (void)kt_loadImage:(UIImage *)image cacheId:(NSString *)cacheId;

/**
 * @abstract Load image from the specified file path.
 * @discussion Only called when cache loading fails.
 */
- (void)kt_loadImageFromPath:(NSString *)path cacheId:(NSString *)cacheId;

/**
 * @abstract Load image from the specified URL.
 * @discussion Only called when cache loading fails.
 */
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
    [self.delegate didFinishLoadingImage];
    self.image = image;
}

- (void)kt_loadImageFromPath:(NSString *)path cacheId:(NSString *)cacheId
{
    // do a background load here
    [self.delegate didStartLoadingImage];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    id <KTPhotosImageCache> imageCacheAgent = [[KTPhotosImageCacheProxy sharedProxy] imageCacheAgent];
    [imageCacheAgent setImage:image forKey:cacheId];
    [self.delegate didFinishLoadingImage];
    self.image = image;
}

- (void)kt_loadImageFromURL:(NSURL *)url cacheId:(NSString *)cacheId
{
    [self.delegate didStartLoadingImage];
    id <KTPhotosImageCache> imageCacheAgent = [[KTPhotosImageCacheProxy sharedProxy] imageCacheAgent];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:0];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFImageResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
        UIImage *image = (UIImage *)response;
        self.image = image;
        [self.delegate didFinishLoadingImage];
        [imageCacheAgent setImage:image forKey:cacheId];
    } failure:nil];
    [op setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead){
        CGFloat progress = ((CGFloat)totalBytesRead)/((CGFloat)totalBytesExpectedToRead);
        [self.delegate didLoadImageWithProgress:progress];
    }];
    [op start];
}

@end
