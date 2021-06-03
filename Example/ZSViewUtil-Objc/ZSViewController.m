//
//  ZSViewController.m
//  ZSViewUtil-Objc
//
//  Created by zhangsen093725 on 03/27/2021.
//  Copyright (c) 2021 zhangsen093725. All rights reserved.
//

#import "ZSViewController.h"
#import "ZSFixedSpecingFlowLayout.h"
#import "ZSFixedSpecingCollectionViewCell.h"

@interface ZSViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIView *lineView;

@end

@implementation ZSViewController

- (UICollectionView *)collectionView {
    
    if (!_collectionView)
    {
        ZSFixedSpecingFlowLayout *flowLayout = [[ZSFixedSpecingFlowLayout alloc] initWithAlignment:ZSFixedSpecingAlignmentRight
                                                                             isLineBreakByClipping:NO
                                                                                  interitemSpacing:10
                                                                                      sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _collectionView.backgroundColor = [UIColor blackColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        
        [_collectionView registerClass:[ZSFixedSpecingCollectionViewCell class] forCellWithReuseIdentifier:[ZSFixedSpecingCollectionViewCell identifier]];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (UIView *)lineView {
    
    if (!_lineView)
    {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_lineView];
    }
    return _lineView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    self.collectionView.frame = CGRectMake(0, 100, self.view.frame.size.width, 400);
    self.lineView.frame = CGRectMake((self.view.bounds.size.width * 0.5), 0, 0.5, self.view.bounds.size.height);
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
    
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZSFixedSpecingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ZSFixedSpecingCollectionViewCell identifier] forIndexPath:indexPath];
    
    cell.lbTitle.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    cell.backgroundColor = [UIColor brownColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(100, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return section % 2 == 0 ? 10 : 20;
}

@end
