//
//  SCNSimpleCategoryViewController.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/6.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNSimpleCategoryViewController.h"
#import <JXCategoryView/JXCategoryView.h>

@interface SCNSimpleCategoryViewController ()<JXCategoryViewDelegate>

@property (weak, nonatomic) IBOutlet JXCategoryTitleView *categoryView;

@end

@implementation SCNSimpleCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.categoryView.titles = @[@"推荐", @"附近", @"菜谱", @"视频"];
    self.categoryView.delegate = self;
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
