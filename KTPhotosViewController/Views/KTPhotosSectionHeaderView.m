//
//  KTPhotosSectionHeaderView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosSectionHeaderView.h"

@interface KTPhotosSectionHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

- (void)kt_configureSectionHeaderView;
- (void)kt_configureConstraintsForTitleLabel;

@end

@implementation KTPhotosSectionHeaderView

+ (void)initialize
{
    KTPhotosSectionHeaderView *proxy = [self appearance];
    proxy.titleLabelFont = [UIFont systemFontOfSize:17.0f];
    proxy.titleLabelColor = [UIColor darkGrayColor];
    proxy.headerBackgroundColor = [UIColor whiteColor];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self kt_configureSectionHeaderView];
    }
    return self;
}

- (void)kt_configureSectionHeaderView
{
    self.accessibilityLabel = KTPhotosSectionHeaderViewAccessibilityLabel;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.font = self.titleLabelFont;
    self.titleLabel.textColor = self.titleLabelColor;
    [self addSubview:self.titleLabel];
    
    [self kt_configureConstraintsForTitleLabel];
}

#pragma mark - KTPhotosSectionHeaderPresenting

- (void)updateWithTitle:(NSString *)title
{
    // TODO: update accessibility label
    self.titleLabel.text = title;
}

#pragma mark - UIAppearance

- (void)setTitleLabelFont:(UIFont *)titleLabelFont
{
    _titleLabelFont = titleLabelFont;
    self.titleLabel.font = titleLabelFont;
}

- (void)setTitleLabelColor:(UIColor *)titleLabelColor
{
    _titleLabelColor = titleLabelColor;
    self.titleLabel.textColor = titleLabelColor;
}

- (void)setHeaderBackgroundColor:(UIColor *)headerBackgroundColor
{
    _headerBackgroundColor = headerBackgroundColor;
    self.backgroundColor = headerBackgroundColor;
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
