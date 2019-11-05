//
//  SCNSimplePageViewController.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/5.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNSimplePageViewController.h"

@interface SCNSimplePageViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic) NSInteger selectedPageIndex;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) UIPageViewController *pageViewController;

@end

@implementation SCNSimplePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewControllers = NSMutableArray.new;
    
    UIViewController *pageOne = [UIViewController new];
    pageOne.view.backgroundColor = UIColor.redColor;
    [self.viewControllers addObject:pageOne];
    
    UIViewController *pageTwo = [UIViewController new];
    pageTwo.view.backgroundColor = UIColor.yellowColor;
    [self.viewControllers addObject:pageTwo];

    UIViewController *pageThree = [UIViewController new];
    pageThree.view.backgroundColor = UIColor.blueColor;
    [self.viewControllers addObject:pageThree];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    [self.pageViewController setViewControllers:@[self.viewControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self.view addSubview:self.pageViewController.view];
    [self addChildViewController:self.pageViewController];
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if (index - 1 < 0) { return nil; }
    return self.viewControllers[index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if (index + 1 > self.viewControllers.count - 1) { return nil; }
    return self.viewControllers[index + 1];
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers
       transitionCompleted:(BOOL)completed {
    if (!finished) { return; }
    self.selectedPageIndex = [self.viewControllers indexOfObject:pageViewController.viewControllers.firstObject];
}

@end
