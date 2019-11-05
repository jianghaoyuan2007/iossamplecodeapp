//
//  SCNWaterfallCollectionViewLayout.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/4.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNWaterfallCollectionViewLayout.h"

@interface SCNWaterfallCollectionViewLayout ()

@property (nonatomic, assign) NSUInteger columns;

@property (nonatomic, assign) CGFloat lineSpacing;

@property (nonatomic, assign) CGFloat interitemSpacing;

@property (nonatomic, assign) UIEdgeInsets contentInsets;

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *layoutAttributes;

@property (nonatomic, strong) NSMutableArray<NSNumber *> *contentHeightOfConlumns;

@property (nonatomic, assign) CGFloat contentHeight;

@end

@implementation SCNWaterfallCollectionViewLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.contentHeight = 0;
    [self.contentHeightOfConlumns removeAllObjects];
    [self.layoutAttributes removeAllObjects];
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    if (numberOfItems == 0) { return; }
    
    for (NSInteger column = 0; column < self.columns; column ++) {
        self.contentHeightOfConlumns[column] = @(0);
    }
    
    for (NSInteger item = 0; item < numberOfItems; item ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.layoutAttributes addObject:attributes];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat contentWidth = CGRectGetWidth(self.collectionView.frame);
    CGFloat cellWidth = (contentWidth - (self.interitemSpacing * (self.columns - 1)) - (self.contentInsets.left + self.contentInsets.right)) / self.columns;
    cellWidth = floor(cellWidth);
    CGFloat cellHeight = [self.delegate collectionViewLayout:self heightForItemAtIndexPath:indexPath];
    NSNumber *contentHeightOfminimumColumn = [self contentHeightOfminimumColumn];
    NSInteger column = [self.contentHeightOfConlumns indexOfObject:contentHeightOfminimumColumn];
    CGFloat x = self.contentInsets.left + column * (cellWidth + self.interitemSpacing);
    CGFloat y = contentHeightOfminimumColumn.doubleValue;
    if (y > 0) { y += self.lineSpacing; }
    attributes.frame = CGRectMake(x, y, cellWidth, cellHeight);
    self.contentHeightOfConlumns[column] = @(CGRectGetMaxY(attributes.frame));
    self.contentHeight = [self contentHeightOfmaximumColumn].doubleValue;
    return attributes;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.layoutAttributes;
}

- (CGSize)collectionViewContentSize {
    CGFloat contentWidth = CGRectGetWidth(self.collectionView.frame);
    return CGSizeMake(contentWidth, self.contentInsets.top + self.contentHeight + self.contentInsets.bottom);
}

#pragma mark - Public

 - (instancetype)initWithColumns:(NSInteger)columns
 delegate:(id<SCNWaterfallCollectionViewLayoutDelegate>)delegate {
    if (self = [super init]) {
        _columns = columns;
        _delegate = delegate;
    }
    return self;
}

#pragma mark - Getters

- (NSMutableArray *)layoutAttributes {
    if (!_layoutAttributes) {
        _layoutAttributes = [NSMutableArray new];
    }
    return _layoutAttributes;
}

- (NSMutableArray *)contentHeightOfConlumns {
    if (!_contentHeightOfConlumns) {
        _contentHeightOfConlumns = NSMutableArray.new;
    }
    return _contentHeightOfConlumns;
}

- (CGFloat)lineSpacing {
    if ([self.delegate respondsToSelector:@selector(lineSpacingInCollectionViewLayout:)]) {
         return [self.delegate lineSpacingInCollectionViewLayout:self];
    }
    return _lineSpacing;
}

- (CGFloat)interitemSpacing {
    if ([self.delegate respondsToSelector:@selector(interitemSpacingInCollectionViewLayout:)]) {
        return [self.delegate interitemSpacingInCollectionViewLayout: self];
    }
    return _interitemSpacing;
}

- (UIEdgeInsets)contentInsets {
    if ([self.delegate respondsToSelector:@selector(contentInsetsInCollectionViewLayout:)]) {
        return [self.delegate contentInsetsInCollectionViewLayout:self];
    }
    return _contentInsets;
}

#pragma mark - Helper

- (NSNumber *)contentHeightOfmaximumColumn {
    NSNumber *contentHeight = self.contentHeightOfConlumns.firstObject;
    for (NSNumber *number in self.contentHeightOfConlumns) {
        if (number.doubleValue > contentHeight.doubleValue) {
            contentHeight = number;
        }
    }
    return contentHeight;
}

- (NSNumber *)contentHeightOfminimumColumn {
    NSNumber *contentHeight = self.contentHeightOfConlumns.firstObject;
    for (NSNumber *number in self.contentHeightOfConlumns) {
        if (number.doubleValue < contentHeight.doubleValue) {
            contentHeight = number;
        }
    }
    return contentHeight;
}

@end
