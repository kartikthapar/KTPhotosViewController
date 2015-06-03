//
//  KTThumbnailItem.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTThumbnailItem.h"

@implementation KTThumbnailItem

#pragma mark - init

- (instancetype)init
{
    NSAssert(NO, @"%s is not a valid initializer for %@.", __PRETTY_FUNCTION__, [self class]);
    return nil;
}

+ (instancetype)thumbnailWithImagePath:(NSString *)imagePath cacheId:(NSString *)cacheId
{
    return [[KTThumbnailItem alloc] initWithImagePath:imagePath date:[NSDate date] cacheId:cacheId];
}

- (instancetype)initWithImagePath:(NSString *)imagePath  date:(NSDate *)date cacheId:(NSString *)cacheId
{
    NSParameterAssert(imagePath);
    NSParameterAssert(date);
    NSParameterAssert(cacheId);
    
    if (self = [super init])
    {
        _imagePath = [imagePath copy];
        _date = [date copy];
        _cacheId = [cacheId copy];
    }
    return self;
}

+ (instancetype)thumbnailWithImage:(UIImage *)image cacheId:(NSString *)cacheId
{
    return [[KTThumbnailItem alloc] initWithImage:image date:[NSDate date] cacheId:cacheId];
}

- (instancetype)initWithImage:(UIImage *)image date:(NSDate *)date cacheId:(NSString *)cacheId
{
    NSParameterAssert(image);
    NSParameterAssert(date);
    NSParameterAssert(cacheId);
    
    if (self = [super init])
    {
        _image = [image copy];
        _date = [date copy];
        _cacheId = [cacheId copy];
    }
    return self;
}

+ (instancetype)thumbnailWithURL:(NSURL *)imageURL cacheId:(NSString *)cacheId
{
    return [[KTThumbnailItem alloc] initWithImageURL:imageURL date:[NSDate date] cacheId:cacheId];
}

- (instancetype)initWithImageURL:(NSURL *)imageURL date:(NSDate *)date cacheId:(NSString *)cacheId
{
    NSParameterAssert(imageURL);
    NSParameterAssert(date);
    NSParameterAssert(cacheId);
    
    if (self = [super init])
    {
        _imageURL = [imageURL copy];
        _date = [date copy];
        _cacheId = [cacheId copy];
    }
    return self;
}

- (void)dealloc
{
    _date = nil;
    _cacheId = nil;
    _imagePath = nil;
    _image = nil;
    _imageURL = nil;
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        _date = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(date))];
        _cacheId = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(cacheId))];
        _imagePath = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(imagePath))];
        _image = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(image))];
        _imageURL = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(imageURL))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.date forKey:NSStringFromSelector(@selector(date))];
    [aCoder encodeObject:self.cacheId forKey:NSStringFromSelector(@selector(cacheId))];
    [aCoder encodeObject:self.imagePath forKey:NSStringFromSelector(@selector(imagePath))];
    [aCoder encodeObject:self.image forKey:NSStringFromSelector(@selector(image))];
    [aCoder encodeObject:self.imageURL forKey:NSStringFromSelector(@selector(imageURL))];
}

@end