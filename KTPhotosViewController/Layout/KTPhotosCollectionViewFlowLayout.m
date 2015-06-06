//
//  KTPhotosCollectionViewFlowLayout.m
//  KTPhotos
//
//  Created by Kartik Thapar on 6/5/15.
//  Copyright (c) 2015 Kartik Thapar. All rights reserved.
//

#import "KTPhotosCollectionViewFlowLayout.h"
#import "KTPhotosCollectionView.h"

#define kDefaultMinimumInteritemSpacing 1.0f
#define kDefaultMinimumLineSpacing 1.0f

@implementation KTPhotosCollectionViewFlowLayout

@dynamic collectionView;

#pragma mark - init

- (instancetype)init
{
    if (self = [super init])
    {
        self.minimumInteritemSpacing = kDefaultMinimumInteritemSpacing;
        self.minimumLineSpacing = kDefaultMinimumLineSpacing;
    }
    return self;
}

#pragma mark - UICollectionViewLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    NSMutableArray *visibleSectionsWithoutHeader = [NSMutableArray array];
    
    for (UICollectionViewLayoutAttributes *itemAttributes in attributes)
    {
        if (![visibleSectionsWithoutHeader containsObject:[NSNumber numberWithInteger:itemAttributes.indexPath.section]])
        {
            [visibleSectionsWithoutHeader addObject:[NSNumber numberWithInteger:itemAttributes.indexPath.section]];
        }
        
        if (itemAttributes.representedElementKind == UICollectionElementKindSectionHeader)
        {
            NSUInteger indexOfSectionObject = [visibleSectionsWithoutHeader indexOfObject:[NSNumber numberWithInteger:itemAttributes.indexPath.section]];
            if (indexOfSectionObject != NSNotFound)
            {
                [visibleSectionsWithoutHeader removeObjectAtIndex:indexOfSectionObject];
            }
        }
    }
    
    for (NSNumber *sectionNumber in visibleSectionsWithoutHeader)
    {
        if ([self shouldStickHeaderToTopInSection:[sectionNumber integerValue]])
        {
            UICollectionViewLayoutAttributes *headerAttributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection : [sectionNumber integerValue]]];
            
            if (headerAttributes.frame.size.width > 0 && headerAttributes.frame.size.height > 0)
            {
                [attributes addObject:headerAttributes];
            }
        }
    }

    for (UICollectionViewLayoutAttributes *itemAttributes in attributes)
    {
        if (itemAttributes.representedElementKind == UICollectionElementKindSectionHeader)
        {
            UICollectionViewLayoutAttributes *headerAttributes = itemAttributes;
            if ([self shouldStickHeaderToTopInSection:headerAttributes.indexPath.section])
            {
                CGPoint contentOffset = self.collectionView.contentOffset;
                CGPoint originInCollectionView = CGPointMake(headerAttributes.frame.origin.x-contentOffset.x, headerAttributes.frame.origin.y-contentOffset.y);
                originInCollectionView.y -= self.collectionView.contentInset.top;
                CGRect frame = headerAttributes.frame;
                
                if (originInCollectionView.y < 0)
                {
                    frame.origin.y += (originInCollectionView.y * -1);
                }
                
                NSInteger numberOfSections = 1;
                if ([self.collectionView.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)])
                {
                    numberOfSections = [self.collectionView.dataSource numberOfSectionsInCollectionView:self.collectionView];
                }
                
                if (numberOfSections>headerAttributes.indexPath.section+1)
                {
                    UICollectionViewLayoutAttributes *nextHeaderAttributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:headerAttributes.indexPath.section + 1]];
                    CGFloat maxY = nextHeaderAttributes.frame.origin.y;
                    if (CGRectGetMaxY(frame) >= maxY)
                    {
                        frame.origin.y = maxY - frame.size.height;
                    }
                }
                headerAttributes.frame = frame;
            }
            headerAttributes.zIndex = 1024;
        }
    }
    return attributes;
}

#pragma mark - Internal

/**
 * @abstract Returns a boolean value indicating if the collection view wants a stick header for the specified section.
 * @param section The section for which the header display is to be ascertain.
 */
- (BOOL)shouldStickHeaderToTopInSection:(NSUInteger)section
{
    return [self.collectionView.delegate collectionView:self.collectionView shouldStickHeaderToTopInSection:section];
}

@end
