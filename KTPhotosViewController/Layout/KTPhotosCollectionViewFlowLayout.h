//
//  KTPhotosCollectionViewFlowLayout.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/5/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTPhotosCollectionView;

@interface KTPhotosCollectionViewFlowLayout : UICollectionViewFlowLayout

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
@property (readonly, nonatomic) KTPhotosCollectionView *collectionView;
#pragma clang diagnostic pop

@end
