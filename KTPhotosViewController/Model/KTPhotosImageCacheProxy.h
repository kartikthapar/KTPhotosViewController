//
//  KTPhotosImageCacheProxy.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/7/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KTPhotosImageCacheAgent;

/**
 * @abstract The `KTPhotosImageCacheProxy` acts a pseudo proxy for cache agents.
 * @discussion The image cache proxy provides an image cache agent to any view or entity that requires image cache operations. The default image cache agent, `KTPhotosImageCacheAgent` is registered with the proxy by default. If you provide your own custom cache, register it with `KTPhotosImageCacheProxy`.
 */
@interface KTPhotosImageCacheProxy : NSObject

/**
 * @abstract Register the specified image cache agent type.
 * @discussion The agent must conform to the `KTPhotosImageCache` protocol. The default value is `[KTPhotosImageCacheProxy defaultImageCacheAgent]`. Currently, only a single cache agent can be used.
 * @param agentType The class for the image cache agent.
 */
+ (void)registerImageCacheAgent:(Class)agentType;

/**
 * @abstract Unregister any custom cache agent if it exists.
 * @discussion If a custom cache agent has been registered, the proxy unregisters the existing cache agent and reverts to the default cache agent. No data is transferred between caches during this unregister operation. However, all images are removed from the cache. If no cache agent was registered, this method returns; i.e. no content is deleted from the existing cache which is the default cache in this case. To remove all the data, use the corresponding cache operations for the default caching agent.
 */
+ (void)unregisterImageCacheAgent;

/**
 * @abstract Returns the type of the default image cache agent for the proxy.
 */
+ (Class)defaultImageCacheAgent;

@end
