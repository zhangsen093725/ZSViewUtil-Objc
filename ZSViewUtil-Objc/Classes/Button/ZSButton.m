//
//  ZSButton.m
//  YunnanTravel
//
//  Created by Josh on 2020/12/3.
//  Copyright © 2020 Tencent. All rights reserved.
//

#import "ZSButton.h"

@implementation ZSButton

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    switch (_imagePosition)
    {
        case ZSButtonImageLeft:
        {
            [self layoutImageLeft];
            break;
        }
        case ZSButtonImageRight:
        {
            [self layoutImageRight];
            break;
        }
        case ZSButtonImageTop:
        {
            [self layoutImageTop];
            break;
        }
        case ZSButtonImageBottom:
        {
            [self layoutImageBottom];
            break;
        }
    }
}

- (CGSize)intrinsicContentSize {
    
    CGSize imageViewSize = [self.imageView intrinsicContentSize];
    CGSize titleLabelSize = [self.titleLabel intrinsicContentSize];
    
    return CGSizeMake(imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right +
                      titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right +
                      self.contentEdgeInsets.left + self.contentEdgeInsets.right,
                      imageViewSize.height + self.imageEdgeInsets.top + self.imageEdgeInsets.bottom +
                      titleLabelSize.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom +
                      self.contentEdgeInsets.top + self.contentEdgeInsets.bottom);
}

- (CGSize)imageViewSize {
    
    CGSize imageViewSize = [self.imageView intrinsicContentSize];
    CGFloat imageViewHeight = MIN(imageViewSize.height, CGRectGetHeight(self.frame));
    imageViewHeight = imageViewHeight > 0 ? imageViewHeight : 0;
    
    CGFloat imageScale = imageViewSize.height > 0 ? imageViewSize.width / imageViewSize.height : 1;
    CGFloat imageViewWidth = MIN(imageViewHeight * imageScale, CGRectGetWidth(self.frame));
    imageViewWidth = imageViewWidth > 0 ? imageViewWidth : 0;
    
    return CGSizeMake(imageViewWidth, imageViewHeight);
}

- (void)layoutImageLeft {
    
    CGSize imageViewSize = [self imageViewSize];
    CGSize titleLabelSize = [self.titleLabel intrinsicContentSize];
    
    CGFloat imageViewX = 0;
    
    switch (self.contentHorizontalAlignment)
    {
        case UIControlContentHorizontalAlignmentCenter:
        {
            imageViewX = (CGRectGetWidth(self.frame) - (imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right +
                                                       titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right)) * 0.5;
            
            break;
        }
        case UIControlContentHorizontalAlignmentLeft:
        {
            imageViewX = self.imageEdgeInsets.left;
            
            break;
        }
        case UIControlContentHorizontalAlignmentRight:
        {
            imageViewX = (CGRectGetWidth(self.frame) - (imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right +
                                                        titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right));
            
            break;
        }
        case UIControlContentHorizontalAlignmentFill:
        {
            imageViewX = self.imageEdgeInsets.left;
            
            break;
        }
        default:
            break;
    }
    
    CGFloat titleLabelY = 0;
    CGFloat imageViewY = 0;
    
    switch (self.contentVerticalAlignment)
    {
        case UIControlContentVerticalAlignmentCenter:
        {
            imageViewY = (CGRectGetHeight(self.frame) - imageViewSize.height - self.imageEdgeInsets.top - self.imageEdgeInsets.bottom) * 0.5;
            titleLabelY = (imageViewSize.height - titleLabelSize.height) * 0.5 + (imageViewY +
                                                                                  self.titleEdgeInsets.top +
                                                                                  self.titleEdgeInsets.bottom);
            
            break;
        }
        case UIControlContentVerticalAlignmentTop:
        {
            imageViewY = self.imageEdgeInsets.top;
            titleLabelY = self.titleEdgeInsets.top;
            
            break;
        }
        case UIControlContentVerticalAlignmentBottom:
        {
            imageViewY = (CGRectGetHeight(self.frame) - imageViewSize.height - self.imageEdgeInsets.bottom);
            titleLabelY = (CGRectGetHeight(self.frame) - titleLabelSize.height - self.titleEdgeInsets.bottom);
            
            break;
        }
        case UIControlContentVerticalAlignmentFill:
        {
            imageViewY = self.imageEdgeInsets.top;
            titleLabelY = self.titleEdgeInsets.top;
            
            break;
        }
        default:
            break;
    }
    
    self.imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewSize.width, imageViewSize.height);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame) + self.titleEdgeInsets.left,
                                       titleLabelY,
                                       titleLabelSize.width,
                                       titleLabelSize.height);
}

- (void)layoutImageRight {
    
    CGSize imageViewSize = [self imageViewSize];
    CGSize titleLabelSize = [self.titleLabel intrinsicContentSize];
    
    CGFloat titleLabelX = 0;
    
    switch (self.contentHorizontalAlignment)
    {
        case UIControlContentHorizontalAlignmentCenter:
        {
            titleLabelX = (CGRectGetWidth(self.frame) - (imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right +
                                                       titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right)) * 0.5;
            
            break;
        }
        case UIControlContentHorizontalAlignmentLeft:
        {
            titleLabelX = self.titleEdgeInsets.left;
            
            break;
        }
        case UIControlContentHorizontalAlignmentRight:
        {
            titleLabelX = (CGRectGetWidth(self.frame) - (imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right +
                                                        titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right));
            
            break;
        }
        case UIControlContentHorizontalAlignmentFill:
        {
            titleLabelX = self.titleEdgeInsets.left;
            
            break;
        }
        default:
            break;
    }
    
    CGFloat titleLabelY = 0;
    CGFloat imageViewY = 0;
    
    switch (self.contentVerticalAlignment)
    {
        case UIControlContentVerticalAlignmentCenter:
        {
            imageViewY = (CGRectGetHeight(self.frame) - imageViewSize.height - self.imageEdgeInsets.top - self.imageEdgeInsets.bottom) * 0.5;
            titleLabelY = (imageViewSize.height - titleLabelSize.height) * 0.5 + (imageViewY +
                                                                                  self.titleEdgeInsets.top +
                                                                                  self.titleEdgeInsets.bottom);
            
            break;
        }
        case UIControlContentVerticalAlignmentTop:
        {
            imageViewY = self.imageEdgeInsets.top;
            titleLabelY = self.titleEdgeInsets.top;
            
            break;
        }
        case UIControlContentVerticalAlignmentBottom:
        {
            imageViewY = (CGRectGetHeight(self.frame) - imageViewSize.height - self.imageEdgeInsets.bottom);
            titleLabelY = (CGRectGetHeight(self.frame) - titleLabelSize.height - self.titleEdgeInsets.bottom);
            
            break;
        }
        case UIControlContentVerticalAlignmentFill:
        {
            imageViewY = self.imageEdgeInsets.top;
            titleLabelY = self.titleEdgeInsets.top;
            
            break;
        }
        default:
            break;
    }
    
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelSize.width, titleLabelSize.height);
    
    CGFloat imageViewX = CGRectGetMaxX(self.titleLabel.frame) + self.imageEdgeInsets.left;
    
    self.imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewSize.width, imageViewSize.height);
}

- (void)layoutImageTop {
    
    CGSize imageViewSize = [self imageViewSize];
    CGSize titleLabelSize = [self.titleLabel intrinsicContentSize];
    
    CGFloat titleLabelX = 0;
    CGFloat imageViewX = 0;
    
    switch (self.contentHorizontalAlignment)
    {
        case UIControlContentHorizontalAlignmentCenter:
        {
            imageViewX = (CGRectGetWidth(self.frame) - (imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right)) * 0.5;
            titleLabelX = (CGRectGetWidth(self.frame) - (titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right)) * 0.5;
            
            break;
        }
        case UIControlContentHorizontalAlignmentLeft:
        {
            imageViewX = self.imageEdgeInsets.left;
            titleLabelX = self.titleEdgeInsets.left;
            
            break;
        }
        case UIControlContentHorizontalAlignmentRight:
        {
            imageViewX = (CGRectGetWidth(self.frame) - (imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right));
            titleLabelX = (CGRectGetWidth(self.frame) - (titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right));
            
            break;
        }
        case UIControlContentHorizontalAlignmentFill:
        {
            imageViewX = self.imageEdgeInsets.left;
            titleLabelX = self.titleEdgeInsets.left;
            
            break;
        }
        default:
            break;
    }
    
    CGFloat imageViewY = 0;
    
    switch (self.contentVerticalAlignment)
    {
        case UIControlContentVerticalAlignmentCenter:
        {
            imageViewY = (CGRectGetHeight(self.frame) - (imageViewSize.height + self.imageEdgeInsets.top + self.imageEdgeInsets.bottom +
                                                         titleLabelSize.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom)) * 0.5;
            
            break;
        }
        case UIControlContentVerticalAlignmentTop:
        {
            imageViewY = self.imageEdgeInsets.top;
            
            break;
        }
        case UIControlContentVerticalAlignmentBottom:
        {
            imageViewY = (CGRectGetHeight(self.frame) - (imageViewSize.height + self.imageEdgeInsets.top + self.imageEdgeInsets.bottom +
                                                         titleLabelSize.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom));
            
            break;
        }
        case UIControlContentVerticalAlignmentFill:
        {
            imageViewY = self.imageEdgeInsets.top;
            
            break;
        }
        default:
            break;
    }
    
    self.imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewSize.width, imageViewSize.height);
    self.titleLabel.frame = CGRectMake(titleLabelX, CGRectGetMaxY(self.imageView.frame) + self.titleEdgeInsets.top,
                                       titleLabelSize.width,
                                       titleLabelSize.height);
}

- (void)layoutImageBottom {
    
    CGSize imageViewSize = [self imageViewSize];
    CGSize titleLabelSize = [self.titleLabel intrinsicContentSize];
    
    CGFloat titleLabelX = 0;
    CGFloat imageViewX = 0;
    
    switch (self.contentHorizontalAlignment)
    {
        case UIControlContentHorizontalAlignmentCenter:
        {
            imageViewX = (CGRectGetWidth(self.frame) - (imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right)) * 0.5;
            titleLabelX = (CGRectGetWidth(self.frame) - (titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right)) * 0.5;
            
            break;
        }
        case UIControlContentHorizontalAlignmentLeft:
        {
            imageViewX = self.imageEdgeInsets.left;
            titleLabelX = self.titleEdgeInsets.left;
            
            break;
        }
        case UIControlContentHorizontalAlignmentRight:
        {
            imageViewX = (CGRectGetWidth(self.frame) - (imageViewSize.width + self.imageEdgeInsets.left + self.imageEdgeInsets.right));
            titleLabelX = (CGRectGetWidth(self.frame) - (titleLabelSize.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right));
            
            break;
        }
        case UIControlContentHorizontalAlignmentFill:
        {
            imageViewX = self.imageEdgeInsets.left;
            titleLabelX = self.titleEdgeInsets.left;
            
            break;
        }
        default:
            break;
    }
    
    CGFloat titleLabelY = 0;
    
    switch (self.contentVerticalAlignment)
    {
        case UIControlContentVerticalAlignmentCenter:
        {
            titleLabelY = (CGRectGetHeight(self.frame) - (imageViewSize.height + self.imageEdgeInsets.top + self.imageEdgeInsets.bottom +
                                                         titleLabelSize.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom)) * 0.5;
            
            break;
        }
        case UIControlContentVerticalAlignmentTop:
        {
            titleLabelY = self.imageEdgeInsets.top;
            
            break;
        }
        case UIControlContentVerticalAlignmentBottom:
        {
            titleLabelY = (CGRectGetHeight(self.frame) - (imageViewSize.height + self.imageEdgeInsets.top + self.imageEdgeInsets.bottom +
                                                         titleLabelSize.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom));
            
            break;
        }
        case UIControlContentVerticalAlignmentFill:
        {
            titleLabelY = self.imageEdgeInsets.top;
            
            break;
        }
        default:
            break;
    }
    
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelSize.width, titleLabelSize.height);
    self.imageView.frame = CGRectMake(imageViewX, CGRectGetMaxY(self.titleLabel.frame) + self.imageEdgeInsets.top,
                                      imageViewSize.width,
                                      imageViewSize.height);
}

@end
