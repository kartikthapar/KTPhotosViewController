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

/**
 * @abstract The data source for the collection view.
 * @discussion The data source must conform to the `KTPhotosCollectionViewDataSource` protocol.
 */
@property (weak, nonatomic) id<KTPhotosCollectionViewDataSource> dataSource;

@end
