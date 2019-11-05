//
//  SCNWaterfallCollectionViewLayout.h
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/4.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCNWaterfallCollectionViewLayout;

NS_ASSUME_NONNULL_BEGIN

@protocol SCNWaterfallCollectionViewLayoutDelegate <NSObject>

@required

- (CGFloat)collectionViewLayout:(SCNWaterfallCollectionViewLayout *)collectionViewLayout
       heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (CGFloat)lineSpacingInCollectionViewLayout:(SCNWaterfallCollectionViewLayout *)collectionViewLayout;

- (CGFloat)interitemSpacingInCollectionViewLayout:(SCNWaterfallCollectionViewLayout *)collectionViewLayout;

- (UIEdgeInsets)contentInsetsInCollectionViewLayout:(SCNWaterfallCollectionViewLayout *)collectionViewLayout;

@end

@interface SCNWaterfallCollectionViewLayout : UICollectionViewFlowLayout

@property (nonatomic, readonly) NSUInteger columns;

@property (nonatomic, readonly) CGFloat lineSpacing;

@property (nonatomic, readonly) CGFloat interitemSpacing;

@property (nonatomic, readonly) UIEdgeInsets contentInsets;

@property (nonatomic, weak) id<SCNWaterfallCollectionViewLayoutDelegate> delegate;

- (instancetype)initWithColumns:(NSInteger)columns
                       delegate:(id<SCNWaterfallCollectionViewLayoutDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
