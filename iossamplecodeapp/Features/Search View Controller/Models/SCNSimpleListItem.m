//
//  SCNSimpleListItem.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/5.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNSimpleListItem.h"

@implementation SCNSimpleListItem

+ (instancetype)itemWithTitle:(NSString *)title
               yearIntroduced:(NSInteger)yearIntroduced
                   introPrice:(double)introPrice {
    SCNSimpleListItem *item = [SCNSimpleListItem new];
    item.title = title;
    item.yearIntroduced = yearIntroduced;
    item.introPrice = introPrice;
    return item;
}

@end
