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
@property (nonatomic, strong) UIVisualEffectView *blurView;
@property (nonatomic, strong, readwrite) UIView *rightAccessoryView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

- (void)kt_configureSectionHeaderView;
- (void)kt_configureConstraintsForBlurView;
- (void)kt_configureConstraintsForTitleLabel;
- (void)kt_configureConstraintsForSubtitleLabel;
- (void)kt_configureConstraintsForRightAccessoryView;
- (void)kt_handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;

@end

@implementation KTPhotosSectionHeaderView

@synthesize sectionIndex;

+ (void)initialize
{
    KTPhotosSectionHeaderView *proxy = [self appearance];
    proxy.titleLabelFont = [UIFont systemFontOfSize:17.0f];
    proxy.titleLabelColor = [UIColor darkGrayColor];
    proxy.subtitleLabelFont = [UIFont systemFontOfSize:14.0f];
    proxy.subtitleLabelColor = [UIColor lightGrayColor];
    proxy.headerBackgroundColor = [UIColor clearColor];
    proxy.rightAccessoryBackgroundColor = [UIColor grayColor];
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
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(kt_handleTapGesture:)];
    [self addGestureRecognizer:self.tapGestureRecognizer];
    
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
    self.blurView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.blurView];
    [self sendSubviewToBack:self.blurView];

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
    
    self.rightAccessoryView = [[UIView alloc] init];
    self.rightAccessoryView.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightAccessoryView.backgroundColor = _rightAccessoryBackgroundColor;
    [self addSubview:self.rightAccessoryView];
    
    [self kt_configureConstraintsForBlurView];
    [self kt_configureConstraintsForTitleLabel];
    [self kt_configureConstraintsForSubtitleLabel];
    [self kt_configureConstraintsForRightAccessoryView];
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

- (void)setRightAccessoryBackgroundColor:(UIColor *)rightAccessoryBackgroundColor
{
    _rightAccessoryBackgroundColor = rightAccessoryBackgroundColor;
    self.rightAccessoryView.backgroundColor = rightAccessoryBackgroundColor;
}

#pragma mark - Actions

- (void)kt_handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint location = [tapGestureRecognizer locationInView:self];
    
    if (CGRectContainsPoint(self.rightAccessoryView.frame, location))
    {
        // notify the delegate about tap event in right accessory view
        [self.delegate sectionHeaderDidTapRightAccessoryView:self];
    }
}

#pragma mark - Constraints

- (void)kt_configureConstraintsForBlurView
{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.blurView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.blurView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    [self addConstraint:widthConstraint];
    [self addConstraint:heightConstraint];
}

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

- (void)kt_configureConstraintsForRightAccessoryView
{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.rightAccessoryView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self.rightAccessoryView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.rightAccessoryView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];

    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:self.rightAccessoryView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:0.98 constant:0.0f];

    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:self.rightAccessoryView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];

    [self addConstraint:widthConstraint];
    [self addConstraint:heightConstraint];
    [self addConstraint:xConstraint];
    [self addConstraint:yConstraint];
}

#pragma mark - Info

+ (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
