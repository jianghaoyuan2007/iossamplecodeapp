//
//  SCNSearchResultViewController.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/5.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNSearchResultViewController.h"
#import "SCNSimpleListItem.h"

@interface SCNSearchResultViewController ()

@end

@implementation SCNSearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SCNSimpleListItem *item = [self.filteredItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%f | %ld", item.introPrice, item.yearIntroduced];
    return cell;
}

@end
