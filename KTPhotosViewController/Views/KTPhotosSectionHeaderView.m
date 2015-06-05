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
@property (nonatomic, strong) UILabel *subtitleLabel;

- (void)kt_configureSectionHeaderView;
- (void)kt_configureConstraintsForTitleLabel;
- (void)kt_configureConstraintsForSubtitleLabel;

@end

@implementation KTPhotosSectionHeaderView

+ (void)initialize
{
    KTPhotosSectionHeaderView *proxy = [self appearance];
    proxy.titleLabelFont = [UIFont systemFontOfSize:17.0f];
    proxy.titleLabelColor = [UIColor darkGrayColor];
    proxy.subtitleLabelFont = [UIFont systemFontOfSize:14.0f];
    proxy.subtitleLabelColor = [UIColor lightGrayColor];
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
    
    self.subtitleLabel = [[UILabel alloc] init];
    self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.subtitleLabel.font = self.subtitleLabelFont;
    self.subtitleLabel.textColor = self.subtitleLabelColor;
    [self addSubview:self.subtitleLabel];
    
    [self kt_configureConstraintsForTitleLabel];
    [self kt_configureConstraintsForSubtitleLabel];
}

#pragma mark - KTPhotosSectionHeaderPresenting

- (void)updateWithTitle:(NSString *)title
{
    // TOOD: accessibility label
    self.titleLabel.text = title;
}

- (void)updateWithSubtitle:(NSString *)subtitle
{
    self.subtitleLabel.text = subtitle;
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

- (void)setSubtitleLabelFont:(UIFont *)subtitleLabelFont
{
    _subtitleLabelFont = subtitleLabelFont;
    self.subtitleLabel.font = subtitleLabelFont;
}

- (void)setSubtitleLabelColor:(UIColor *)subtitleLabelColor
{
    _subtitleLabelColor = subtitleLabelColor;
    self.subtitleLabel.textColor = subtitleLabelColor;
}

- (void)setHeaderBackgroundColor:(UIColor *)headerBackgroundColor
{
    _headerBackgroundColor = headerBackgroundColor;
    self.backgroundColor = headerBackgroundColor;
}

#pragma mark - Constraints

- (void)kt_configureConstraintsForTitleLabel
{
    NSDictionary *metrics = @{@"leftMargin": @(15),
                              @"topMargin": @(5)};
    NSDictionary *views = @{@"titleLabel": self.titleLabel};
    NSArray *leftMarginConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftMargin-[titleLabel]" options:0 metrics:metrics views:views];
    NSArray *topMarginConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[titleLabel]" options:0 metrics:metrics views:views];

    [self addConstraints:leftMarginConstraint];
    [self addConstraints:topMarginConstraint];
}

- (void)kt_configureConstraintsForSubtitleLabel
{
    NSDictionary *metrics = @{@"leftMargin": @(15),
                              @"titleTopMargin": @(5),
                              @"subtitleTopMargin": @(0),
                              @"subtitleBotMargin": @(5)};
    NSDictionary *views = @{@"subtitleLabel": self.subtitleLabel,
                            @"titleLabel":self.titleLabel};

    NSString *xConstraintFormat = @"H:|-leftMargin-[subtitleLabel]";
    NSArray *xConstraint = [NSLayoutConstraint constraintsWithVisualFormat:xConstraintFormat options:0 metrics:metrics views:views];
    NSString *yConstraintFormat = @"V:|-titleTopMargin-[titleLabel]->=subtitleTopMargin-[subtitleLabel]-subtitleBotMargin-|";
    NSArray *yConstraint = [NSLayoutConstraint constraintsWithVisualFormat:yConstraintFormat options:0 metrics:metrics views:views];
    
    [self addConstraints:xConstraint];
    [self addConstraints:yConstraint];
}

#pragma mark - Info

+ (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
