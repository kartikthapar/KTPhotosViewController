//
//  SamplePhotosSectionHeaderView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "SamplePhotosSectionHeaderView.h"

@implementation SamplePhotosSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self configureSectionHeaderView];
    }
    return self;
}

- (void)configureSectionHeaderView
{
    self.accessibilityLabel = SamplePhotosSectionHeaderViewAccessibilityLabel;
    self.backgroundColor = [UIColor blueColor];
}

+ (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
