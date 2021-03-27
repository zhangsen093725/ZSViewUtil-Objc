//
//  ZSFixedSpecingCollectionViewCell.m
//  ZSViewUtil-Objc_Example
//
//  Created by Josh on 2021/3/27.
//  Copyright © 2021 zhangsen093725. All rights reserved.
//

#import "ZSFixedSpecingCollectionViewCell.h"

@implementation ZSFixedSpecingCollectionViewCell

+ (NSString *)identifier {
    
    return NSStringFromClass([self class]);
}

- (UILabel *)lbTitle {
    
    if (!_lbTitle)
    {
        _lbTitle = [UILabel new];
        _lbTitle.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lbTitle];
    }
    return _lbTitle;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.lbTitle.frame = self.contentView.bounds;
}

@end
