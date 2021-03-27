//
//  ZSFixedSpecingCollectionViewCell.h
//  ZSViewUtil-Objc_Example
//
//  Created by Josh on 2021/3/27.
//  Copyright © 2021 zhangsen093725. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZSFixedSpecingCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *lbTitle;

+ (NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
