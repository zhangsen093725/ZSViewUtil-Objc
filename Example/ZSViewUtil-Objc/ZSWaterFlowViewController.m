//
//  ZSWaterFlowViewController.m
//  ZSViewUtil-Objc_Example
//
//  Created by Josh on 2021/4/6.
//  Copyright © 2021 zhangsen093725. All rights reserved.
//

#import "ZSWaterFlowViewController.h"
#import "ZSWaterFlowLayout.h"
#import "ZSFixedSpecingCollectionViewCell.h"

@interface ZSWaterFlowViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, ZSWaterFlowLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZSWaterFlowViewController

- (UICollectionView *)collectionView {
    
    if (!_collectionView)
    {
        ZSWaterFlowLayout *flowLayout = [[ZSWaterFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor blackColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ZSFixedSpecingCollectionViewCell class] forCellWithReuseIdentifier:[ZSFixedSpecingCollectionViewCell identifier]];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    self.collectionView.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 30;
}

- (NSInteger)zs_collectionView:(UICollectionView *)collectionView flowLayout:(ZSWaterFlowLayout *)flowLayout columnNumberOfSection:(NSInteger)section {
    
    return 2;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZSFixedSpecingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ZSFixedSpecingCollectionViewCell identifier] forIndexPath:indexPath];
    
    cell.lbTitle.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    cell.backgroundColor = [UIColor brownColor];
    
    return cell;
}

- (CGSize)zs_collectionView:(UICollectionView *)collectionView flowLayout:(ZSWaterFlowLayout *)flowLayout minimumSize:(CGSize)minimumSize sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
 
    if (flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal)
    {
        return CGSizeMake(20 * ((indexPath.item % 5) + 1), minimumSize.height);
    }
    
    return CGSizeMake(minimumSize.width, 20 * ((indexPath.item % 10) + 1));
}

- (CGFloat)zs_collectionView:(UICollectionView *)collectionView flowLayout:(ZSWaterFlowLayout *)flowLayout sectionSpacingForSection:(NSInteger)section {
    
    return 10;
}

@end
