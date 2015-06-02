//
//  KTPhotosCollectionViewCell.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosCollectionViewCell.h"

@interface KTPhotosCollectionViewCell ()

@property (nonatomic, strong, readwrite) UIImageView *photoImageView;

- (void)kt_configureCollectionViewCell;

@end

@implementation KTPhotosCollectionViewCell

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self kt_configureCollectionViewCell];
    }
    return self;
}

- (void)dealloc
{
    _photoImageView = nil;
}

- (void)kt_configureCollectionViewCell
{
    self.backgroundColor = [UIColor whiteColor];
    
    // photoImageView
    // TODO: custom image view required
    self.photoImageView = [[UIImageView alloc] init];
    self.photoImageView.backgroundColor = [UIColor lightGrayColor];
    self.photoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.photoImageView];
    [self kt_configureLayoutConstraintsForPhotoImageview];
}

#pragma mark - UICollectionViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.photoImageView.image = nil;
    self.photoImageView.highlightedImage = nil;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.photoImageView.highlighted = highlighted;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.photoImageView.highlighted = selected;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    
    self.photoImageView.backgroundColor = backgroundColor;
}

#pragma mark - Constraints

- (void)kt_configureLayoutConstraintsForPhotoImageview
{
    // photoImageView.height = contentView.height
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.photoImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    // photoImageView.width = contentView.width
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.photoImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
}

#pragma mark - Info

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
