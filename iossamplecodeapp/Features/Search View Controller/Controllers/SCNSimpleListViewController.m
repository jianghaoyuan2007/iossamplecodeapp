//
//  SCNSimpleListViewController.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/5.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNSimpleListViewController.h"
#import "SCNSimpleListItem.h"
#import "SCNSearchResultViewController.h"

/*
 https://docs-assets.developer.apple.com/published/b1f714309b/DisplayingSearchableContentByUsingASearchController.zip
 */

@interface SCNSimpleListViewController ()<UISearchResultsUpdating, UITableViewDelegate, UISearchControllerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) SCNSearchResultViewController *searchResultViewController;

@end

@implementation SCNSimpleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = NSMutableArray.new;
    
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"Ginger" yearIntroduced:2007 introPrice:49.98]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"Gladiolus" yearIntroduced:2001 introPrice:16.99]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"Orchid" yearIntroduced:2007 introPrice:31.99]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"Poinsettia" yearIntroduced:2010 introPrice:24.99]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"RedRose" yearIntroduced:2011 introPrice:24.99]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"WhiteRose" yearIntroduced:2007 introPrice:24.99]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"Tulip" yearIntroduced:2012 introPrice:39.99]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"Carnation" yearIntroduced:2017 introPrice:23.99]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"Sunflower" yearIntroduced:2016 introPrice:25.00]];
    [self.items addObject:[SCNSimpleListItem itemWithTitle:@"Gardenia" yearIntroduced:2007 introPrice:25.00]];

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SearchViewController" bundle:nil];
    
    self.searchResultViewController = [sb instantiateViewControllerWithIdentifier:@"SCNSearchResultViewController"];
    self.searchResultViewController.tableView.delegate = self;
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchResultViewController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.autocapitalizationType = NO;

    if (@available(iOS 11.0, *)) {
        self.navigationItem.searchController = self.searchController;
        self.navigationItem.hidesSearchBarWhenScrolling = NO;
    } else {
        // Fallback on earlier versions
        self.tableView.tableHeaderView = self.searchController.searchBar;
    }
    self.searchController.searchBar.delegate = self;
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.definesPresentationContext = YES;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCNSimpleListItem *item = [self.items objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%f | %ld", item.introPrice, item.yearIntroduced];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SCNSimpleListItem *selectedItem = nil;
    if (self.tableView == tableView) {
        selectedItem = [self.items objectAtIndex:indexPath.row];
    } else {
        selectedItem = [self.searchResultViewController.filteredItems objectAtIndex:indexPath.row];
    }
    NSLog(@"%@", selectedItem);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSMutableArray *searchResults = self.items;
    [searchResults removeLastObject];
    [searchResults removeLastObject];
    if (searchController.searchResultsController == self.searchResultViewController) {
        self.searchResultViewController.filteredItems = searchResults;
    }
}

@end
