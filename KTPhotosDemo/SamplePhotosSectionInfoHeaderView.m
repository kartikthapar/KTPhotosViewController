//
//  SamplePhotosSectionInfoHeaderView.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/4/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "SamplePhotosSectionInfoHeaderView.h"

@implementation SamplePhotosSectionInfoHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self configureSectionInfoHeaderView];
    }
    return self;
}

- (void)configureSectionInfoHeaderView
{
    self.accessibilityLabel = SamplePhotosSectionInfoHeaderViewAccessibilityLabel;
    self.backgroundColor = [UIColor blueColor];
}

+ (NSString *)headerReuseIdentifier
{
    return NSStringFromClass([self class]);
}

@end
