//
//  KTPhotosSectionInfoHeaderView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosSectionInfoHeaderView.h"

@interface KTPhotosSectionInfoHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

- (void)kt_configureSectionInfoHeaderView;
- (void)kt_configureConstraintsForTitleLabel;

@end

@implementation KTPhotosSectionInfoHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self kt_configureSectionInfoHeaderView];
    }
    return self;
}

- (void)kt_configureSectionInfoHeaderView
{
    self.accessibilityLabel = KTPhotosSectionInfoHeaderViewAccessibilityLabel;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleLabel];
    
    [self kt_configureConstraintsForTitleLabel];
}

#pragma mark - Constraints

- (void)kt_configureConstraintsForTitleLabel
{
    NSDictionary *metrics = @{@"leftMargin":@(15),
                              @"topMargin":@(5)};
    NSDictionary *views = @{@"titleLabel": self.titleLabel};
    NSArray *leftMarginConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftMargin-[titleLabel]" options:0 metrics:metrics views:views];
    NSArray *topMarginConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[titleLabel]" options:0 metrics:metrics views:views];

    [self addConstraints:leftMarginConstraint];
    [self addConstraints:topMarginConstraint];
}

#pragma mark - Info

+ (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
