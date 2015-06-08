//
//  KTPhotosImageCacheProxy.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/7/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KTPhotosImageCache;
@class KTPhotosImageCacheAgent;


/**
 * @abstract The `KTPhotosImageCacheProxy` acts a pseudo proxy for cache agents.
 * @discussion The image cache proxy provides an image cache agent to any view or entity that requires image cache operations. The default image cache agent, `KTPhotosImageCacheAgent` is registered with the proxy by default. If you provide your own custom cache, register it with `KTPhotosImageCacheProxy`.
 */
@interface KTPhotosImageCacheProxy : NSObject

#pragma mark - init

/**
 * @abstract Returns a shared instance of the `KTPhotosImageCacheProxy` class.
 * @discussion This is the designated initializer for creating a shared proxy. No other initializers available.
 */
+ (instancetype)sharedProxy;

/**
 * @abstract Unavailable.
 * @see sharedProxy
 */
- (instancetype)init NS_UNAVAILABLE;

/**
 * @abstract Unavailable.
 * @see sharedProxy
 */
+ (instancetype)new NS_UNAVAILABLE;

#pragma mark - Cache Agent

/**
 * @abstract Register the specified image cache agent type.
 * @discussion The agent must conform to the `KTPhotosImageCache` protocol. The default value is `[KTPhotosImageCacheProxy defaultImageCacheAgent]`. Currently, only a single cache agent can be used. The proxy retains a strong instance of the provided cache agent. If the cache agent is the same as the current cache agent, then the old cache agent is unregistered with all it's image cache deleted; the new cache agent is then registered with the proxy.
 * @param agent The image cache agent for caching operations. The agent must conform to the `KTPhotosImageCache` protocol.
 */
- (void)registerImageCacheAgent:(id<KTPhotosImageCache>)agent;

/**
 * @abstract Unregister any custom cache agent if it exists.
 * @discussion If a custom cache agent has been registered, the proxy unregisters the existing cache agent and reverts to the default cache agent. No data is transferred between caches during this unregister operation. However, all images are removed from the cache. If no cache agent was registered, the proxy unregisters the default cache agent and re-registers the default cache agent; i.e. deletes all image content in this process (for consistency purposes).
 */
- (void)unregisterImageCacheAgent;

/**
 * @abstract Returns the currently operational image cache agent for the proxy.
 */
- (id<KTPhotosImageCache>)imageCacheAgent;

/**
 * @abstract Returns the type of the default image cache agent for the proxy.
 * @discussion The default image cache agent might not the currently operational cache agent for the proxy.
 */
- (id<KTPhotosImageCache>)defaultImageCacheAgent;

@end
