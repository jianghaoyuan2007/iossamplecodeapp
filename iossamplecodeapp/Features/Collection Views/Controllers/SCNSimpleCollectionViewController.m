//
//  SCNSimpleCollectionViewController.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/4.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNSimpleCollectionViewController.h"
#import "SCNSimpleCollectionViewHeaderView.h"
#import "SCNSimpleCollectionViewCell.h"

@interface SCNSimpleCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic) CGFloat itemsPerRow;
@property (nonatomic) UIEdgeInsets sectionInsets;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SCNSimpleCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.itemsPerRow = 4;
    self.sectionInsets = UIEdgeInsetsMake(0, 1, 0, 1);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 1.0;
    flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 40);
    self.collectionView.collectionViewLayout = flowLayout;
    
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
    return 100;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {

        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:UICollectionElementKindSectionHeader forIndexPath:indexPath];
        [headerView setNeedsLayout];
        return headerView;
    }
    return UICollectionReusableView.new;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = cell.backgroundColor = UIColor.blueColor;
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat paddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1);
    CGFloat availableWidth = self.view.frame.size.width - paddingSpace;
    CGFloat widthPerItem = floor(availableWidth / self.itemsPerRow);
    return CGSizeMake(widthPerItem, widthPerItem);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return self.sectionInsets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.sectionInsets.left;
}


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Index Path: %@", indexPath);
}


@end
