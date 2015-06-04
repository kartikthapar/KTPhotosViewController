//
//  SamplePhotosCollectionViewCell.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/3/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "SamplePhotosCollectionViewCell.h"

@implementation SamplePhotosCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self configureCollectionViewCell];
    }
    return self;
}

- (void)configureCollectionViewCell
{
    self.accessibilityLabel = SampleCollectionViewCellAccessibilityLabel;
    self.backgroundColor = [UIColor lightGrayColor];
    
    _imageView = [[UIImageView alloc] init];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.imageView];
    [self configureConstraintsForImageView];
}

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

#pragma mark - Constraints

- (void)configureConstraintsForImageView
{
    // photoImageView.height = contentView.height
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    // photoImageView.width = contentView.width
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
}

#pragma mark - KTPhotosThumbnailPresenting

- (void)updateWithPhotoItem:(id<KTPhotoData>)photoItem
{
    if ([photoItem image])
    {
        self.imageView.image = [photoItem image];
    }
}

@end
