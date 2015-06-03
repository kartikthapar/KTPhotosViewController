//
//  KTPhotosCollectionViewCell.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/1/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosCollectionViewCell.h"
#import "KTPhotosThumbnailImageView.h"

@interface KTPhotosCollectionViewCell ()

@property (nonatomic, strong, readwrite) KTPhotosThumbnailImageView *photoImageView;

- (void)kt_configureCollectionViewCell;

@end

@implementation KTPhotosCollectionViewCell

#pragma mark - init

+ (void)initialize
{
    KTPhotosCollectionViewCell *proxy = [self appearance];
    proxy.cellBackgroundColor = [UIColor whiteColor];
}

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
    // photoImageView
    self.photoImageView = [[KTPhotosThumbnailImageView alloc] init];
    self.photoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.photoImageView];
    [self kt_configureLayoutConstraintsForPhotoImageview];
    
    self.accessibilityLabel = KTPhotosCollectionViewCellAccessibilityLabel;
}

#pragma mark - UIAppearance

- (void)setCellBackgroundColor:(UIColor *)cellBackgroundColor
{
    _cellBackgroundColor = cellBackgroundColor;
    self.backgroundColor = cellBackgroundColor;
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

#pragma mark - KTPhotosThumbnailPresenting

- (void)updateWithPhotoItem:(id<KTPhotoData>)photoItem
{
    self.photoImageView.photoItem = photoItem;
    [self setNeedsUpdateConstraints];
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
