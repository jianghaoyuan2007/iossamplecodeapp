//
//  SCNWaterfallCollectionViewController.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/4.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNWaterfallCollectionViewController.h"
#import "SCNWaterfallCollectionViewLayout.h"
#import "SCNWaterfallCollectionViewItem.h"
#import "SCNWaterfallCollectionViewCell.h"

@interface SCNWaterfallCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, SCNWaterfallCollectionViewLayoutDelegate>

@property (nonatomic) CGFloat itemsPerRow;
@property (nonatomic) UIEdgeInsets sectionInsets;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SCNWaterfallCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.itemsPerRow = 4;
    self.sectionInsets = UIEdgeInsetsMake(0, 1, 0, 1);
    
    self.collectionView.collectionViewLayout = [[SCNWaterfallCollectionViewLayout alloc] initWithColumns:2 delegate:self];
    
    [self.collectionView registerClass:UICollectionViewCell.class
            forCellWithReuseIdentifier:NSStringFromClass(UICollectionViewCell.class)];
    [self.collectionView registerClass:UICollectionReusableView.class
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:UICollectionElementKindSectionHeader];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = cell.backgroundColor = UIColor.blueColor;
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Index Path: %@", indexPath);
}

#pragma mark - SCNWaterfallCollectionViewLayoutDelegate

- (CGFloat)collectionViewLayout:(SCNWaterfallCollectionViewLayout *)collectionViewLayout
       heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)lineSpacingInCollectionViewLayout:(SCNWaterfallCollectionViewLayout *)collectionViewLayout {
    return 1;
}

- (CGFloat)interitemSpacingInCollectionViewLayout:(SCNWaterfallCollectionViewLayout *)collectionViewLayout {
    return 1;
}

- (UIEdgeInsets)contentInsetsInCollectionViewLayout:(SCNWaterfallCollectionViewLayout *)collectionViewLayout {
    return UIEdgeInsetsMake(10, 1, 10, 1);
}

@end
