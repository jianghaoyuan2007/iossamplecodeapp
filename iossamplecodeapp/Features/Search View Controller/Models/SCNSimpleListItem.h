//
//  SCNSimpleListItem.h
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/5.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCNSimpleListItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger yearIntroduced;

@property (nonatomic, assign) double introPrice;

+ (instancetype)itemWithTitle:(NSString *)title
               yearIntroduced:(NSInteger)yearIntroduced
                   introPrice:(double)introPrice;
@end

NS_ASSUME_NONNULL_END
