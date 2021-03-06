//
//  KTPhotosSectionHeaderView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosSectionHeaderView.h"

@interface KTPhotosSectionHeaderView ()

@property (nonatomic, strong) UIVisualEffectView *blurView;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UIButton *rightAccessoryButton;
@property (nonatomic, strong, readwrite) UIButton *leftAccessoryButton;

@property (nonatomic, strong) NSLayoutConstraint *titleLabelWithLeftAccessoryConstraint;
@property (nonatomic, strong) NSLayoutConstraint *titleLabelWithoutLeftAccessoryConstraint;
@property (nonatomic, strong) NSLayoutConstraint *titleLabelWithRightAccessoryConstraint;
@property (nonatomic, strong) NSLayoutConstraint *titleLabelWithoutRightAccessoryConstraint;

@property (nonatomic, strong, readwrite) UITapGestureRecognizer *tapGestureRecognizer;

- (void)kt_configureSectionHeaderView;
- (void)kt_configureConstraintsForBlurView;
- (void)kt_configureConstraintsForTitleLabel;
- (void)kt_configureConstraintsForRightAccessoryButton;
- (void)kt_configureConstraintsForLeftAccessoryButton;
- (void)kt_didTapRightAccessoryButton:(id)sender;
- (void)kt_didTapLeftAccessoryButton:(id)sender;
- (void)kt_handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;

@end

@implementation KTPhotosSectionHeaderView

@synthesize sectionIndex;

+ (void)initialize
{
    KTPhotosSectionHeaderView *proxy = [self appearance];
    proxy.titleLabelFont = [UIFont systemFontOfSize:17.0f];
    proxy.titleLabelColor = [UIColor darkGrayColor];
    proxy.headerBackgroundColor = [UIColor clearColor];
    proxy.rightAccessoryBackgroundColor = [UIColor grayColor];
    proxy.leftAccessoryBackgroundColor = [UIColor grayColor];
    proxy.blurEffectStyle = UIBlurEffectStyleExtraLight;
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
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.font = self.titleLabelFont;
    self.titleLabel.textColor = self.titleLabelColor;
    [self addSubview:self.titleLabel];
    
    self.leftAccessoryButton = [[UIButton alloc] init];
    self.leftAccessoryButton.hidden = YES;
    [self.leftAccessoryButton addTarget:self action:@selector(kt_didTapLeftAccessoryButton:) forControlEvents:UIControlEventTouchUpInside];
    self.leftAccessoryButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftAccessoryButton.backgroundColor = self.leftAccessoryBackgroundColor;
    self.leftAccessoryButton.layer.masksToBounds = YES;
    [self addSubview:self.leftAccessoryButton];
    
    self.rightAccessoryButton = [[UIButton alloc] init];
    self.rightAccessoryButton.hidden = YES;
    [self.rightAccessoryButton addTarget:self action:@selector(kt_didTapRightAccessoryButton:) forControlEvents:UIControlEventTouchUpInside];
    self.rightAccessoryButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightAccessoryButton.backgroundColor = self.rightAccessoryBackgroundColor;
    self.rightAccessoryButton.layer.masksToBounds = YES;
    [self addSubview:self.rightAccessoryButton];
    
    [self kt_configureConstraintsForTitleLabel];
    [self kt_configureConstraintsForRightAccessoryButton];
    [self kt_configureConstraintsForLeftAccessoryButton];
}

#pragma mark - KTPhotosSectionHeaderPresenting

- (void)updateWithTitle:(NSString *)title
{
    // TOOD: accessibility label
    self.titleLabel.text = title;
}

- (void)showLeftAccessoryButton
{
    self.leftAccessoryButton.hidden = NO;
    [self setNeedsUpdateConstraints];
}

- (void)showRightAccessoryButton
{
    self.rightAccessoryButton.hidden = NO;
    [self setNeedsUpdateConstraints];
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

- (void)setRightAccessoryBackgroundColor:(UIColor *)rightAccessoryBackgroundColor
{
    _rightAccessoryBackgroundColor = rightAccessoryBackgroundColor;
    self.rightAccessoryButton.backgroundColor = rightAccessoryBackgroundColor;
}

- (void)setLeftAccessoryBackgroundColor:(UIColor *)leftAccessoryBackgroundColor
{
    _leftAccessoryBackgroundColor = leftAccessoryBackgroundColor;
    self.leftAccessoryButton.backgroundColor = leftAccessoryBackgroundColor;
}

- (void)setBlurEffectStyle:(UIBlurEffectStyle)blurEffectStyle
{
    _blurEffectStyle = blurEffectStyle;
    
    // remove the view from the heirarchy
    [self.blurView removeFromSuperview];
    self.blurView = nil;
    
    // create a new and add it
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:blurEffectStyle];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
    self.blurView.translatesAutoresizingMaskIntoConstraints = NO;
    
    if (![_blurView isDescendantOfView:self])
    {
        [self addSubview:_blurView];
        [self sendSubviewToBack:_blurView];
    }
    
    [self kt_configureConstraintsForBlurView];
    [self setNeedsUpdateConstraints];
}

#pragma mark - Actions

- (void)kt_didTapRightAccessoryButton:(id)sender
{
    [self.delegate sectionHeaderDidTapRightAccessoryButton:self];
}

- (void)kt_didTapLeftAccessoryButton:(id)sender
{
    [self.delegate sectionHeaderDidTapLeftAccessoryButton:self];
}

- (void)kt_handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint location = [tapGestureRecognizer locationInView:self];
    
    // TODO: find the exact rect of the title label (with the text)
    
    if (CGRectContainsPoint(self.titleLabel.frame, location))
    {
        [self.delegate sectionHeaderDidTapTitleLabel:self];
    }
    else
    {
        [self.delegate sectionHeaderDidTapHeaderView:self atPosition:location];
    }
}

#pragma mark - Constraints

- (void)updateConstraints
{
    if (self.leftAccessoryButton.isHidden)
    {
        [self removeConstraint:self.titleLabelWithLeftAccessoryConstraint];
        [self addConstraint:self.titleLabelWithoutLeftAccessoryConstraint];
    }
    else
    {
        [self removeConstraint:self.titleLabelWithoutLeftAccessoryConstraint];
        [self addConstraint:self.titleLabelWithLeftAccessoryConstraint];
    }
    
    if (self.rightAccessoryButton.isHidden)
    {
        [self removeConstraint:self.titleLabelWithRightAccessoryConstraint];
        [self addConstraint:self.titleLabelWithoutRightAccessoryConstraint];
    }
    else
    {
        [self removeConstraint:self.titleLabelWithoutRightAccessoryConstraint];
        [self addConstraint:self.titleLabelWithRightAccessoryConstraint];
    }
    
    [super updateConstraints];
}

- (void)kt_configureConstraintsForBlurView
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.blurView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.blurView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
}

- (void)kt_configureConstraintsForTitleLabel
{
    // x constraint based on left accessory button
    self.titleLabelWithLeftAccessoryConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.leftAccessoryButton attribute:NSLayoutAttributeRight multiplier:1 constant:10];
    self.titleLabelWithoutLeftAccessoryConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    
    // x constraint based on right accessory button
    self.titleLabelWithRightAccessoryConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.rightAccessoryButton attribute:NSLayoutAttributeLeft multiplier:1 constant:-10];
    self.titleLabelWithoutRightAccessoryConstraint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (void)kt_configureConstraintsForRightAccessoryButton
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.rightAccessoryButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.6 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.rightAccessoryButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.rightAccessoryButton attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.rightAccessoryButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.rightAccessoryButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (void)kt_configureConstraintsForLeftAccessoryButton
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.leftAccessoryButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.6 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.leftAccessoryButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.leftAccessoryButton attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.leftAccessoryButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.leftAccessoryButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

#pragma mark - Info

+ (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
