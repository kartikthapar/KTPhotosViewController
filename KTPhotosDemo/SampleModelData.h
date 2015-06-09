//
//  SampleModelData.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/2/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KTPhotos.h"

@interface SampleModelData : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *thumbnails;
@property (nonatomic, strong, readonly) NSMutableArray *photos;

- (NSInteger)numberOfSections;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;

- (KTPhotoItem *)thumbnailAtIndexPath:(NSIndexPath *)indexPath;

@end
