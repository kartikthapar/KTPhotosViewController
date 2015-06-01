//
//  KTPhotosCollectionView.h
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KTPhotosCollectionViewDataSource.h"

@interface KTPhotosCollectionView : UICollectionView

@property (weak, nonatomic) id<KTPhotosCollectionViewDataSource> dataSource;

@end
