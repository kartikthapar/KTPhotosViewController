//
//  KTPhotosSectionInfoHeaderView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosSectionInfoHeaderView.h"

@interface KTPhotosSectionInfoHeaderView ()

- (void)kt_configureSectionInfoHeaderView;

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
}

#pragma mark - Info

+ (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
