//
//  KTPhotosImageCacheProxyTests.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/8/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "KIF.h"
#import "Expecta.h"

#import "KTPhotos.h"

@interface KTPhotosImageCacheProxy ()

@property (nonatomic, strong) KTPhotosImageCacheAgent *defaultCacheAgent;
@property (nonatomic, strong) id<KTPhotosImageCache> cacheAgent;

- (void)kt_resetCache;
- (KTPhotosImageCacheAgent *)kt_defaultAgent;

@end

@interface KTPhotosImageCacheProxyTests : XCTestCase

@end

@implementation KTPhotosImageCacheProxyTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Tests

- (void)testPhotosImageCacheProxyInit
{
//    [[KTPhotosImageCacheProxy alloc] init]; //unavailable
//    [KTPhotosImageCacheProxy new]; //unavailable
    
    // singleton
    KTPhotosImageCacheProxy *proxy = [KTPhotosImageCacheProxy sharedProxy];
    expect(proxy).toNot.beNil();
    KTPhotosImageCacheProxy *anotherProxy = [KTPhotosImageCacheProxy sharedProxy];
    expect(proxy).to.equal(anotherProxy);
    
    // currently both are the same
    expect([proxy defaultImageCacheAgent]).to.beInstanceOf([KTPhotosImageCacheAgent class]);
    expect([proxy imageCacheAgent]).to.beInstanceOf([KTPhotosImageCacheAgent class]);
    expect([proxy imageCacheAgent]).to.equal([proxy defaultImageCacheAgent]);
}

- (void)testImageCacheUnregistration
{
    KTPhotosImageCacheProxy *proxy = [KTPhotosImageCacheProxy sharedProxy];
    id proxyMock = OCMPartialMock(proxy);
    
    KTPhotosImageCacheAgent *agent = [[KTPhotosImageCacheAgent alloc] init];
    id mockAgent = OCMPartialMock(agent);
    OCMStub([proxyMock cacheAgent]).andReturn(mockAgent);
    
    // CUD
    [proxy unregisterImageCacheAgent];
    
    OCMVerify([proxyMock kt_resetCache]); // cache is supposed to reset always
    OCMVerify([mockAgent removeAllImages]); // images are removed always
    OCMVerify([proxyMock kt_defaultAgent]); // new cache agent created always
}

- (void)testImageCacheRegistrationWithKTPhotosImageCacheAgent
{
    KTPhotosImageCacheProxy *proxy = [KTPhotosImageCacheProxy sharedProxy];
   id proxyMock = OCMPartialMock(proxy);

    KTPhotosImageCacheAgent *agent = [[KTPhotosImageCacheAgent alloc] init];
    
    // CUD
    [proxy registerImageCacheAgent:agent];
    
    OCMVerify([proxyMock unregisterImageCacheAgent]); // always unregisters the current cache agent
    expect(proxy.cacheAgent).to.equal(agent);
}

@end
