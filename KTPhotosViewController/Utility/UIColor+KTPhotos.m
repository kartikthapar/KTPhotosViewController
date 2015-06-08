//
//  UIColor+KTPhotos.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/7/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "UIColor+KTPhotos.h"

@implementation UIColor (KTPhotos)

+ (instancetype)offshadeColor
{
    CGFloat tone = 247/255.0f;
    return [self colorWithRed:tone green:tone blue:tone alpha:1.0f];
}

@end
