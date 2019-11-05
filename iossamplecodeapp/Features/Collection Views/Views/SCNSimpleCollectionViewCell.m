//
//  SCNSimpleCollectionViewCell.m
//  iossamplecodeapp
//
//  Created by Stephen Chiang on 2019/11/4.
//  Copyright © 2019 stephenchiang.net. All rights reserved.
//

#import "SCNSimpleCollectionViewCell.h"

@implementation SCNSimpleCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = UIColor.yellowColor;
}

@end
