//
//  ZLSingleSectionController.m
//  HCGitModule_Example
//
//  Created by 卿之 on 2024/4/18.
//  Copyright © 2024 范鹏. All rights reserved.
//

#import "ZLSingleSectionController.h"
@interface ZLSingleSectionController()
@property (nonatomic,copy)ZLItemsCountBlock itemsCountBlock;
@property (nonatomic,copy)ZLSizeBlock sizeBlock;
@property (nonatomic,copy)ZLCellBlock cellBlock;
@property (nonatomic,copy)ZLDidSelectCellBlock selectBlock;
@property (nonatomic,copy)ZLSupplementaryBlock supplementaryBlock;
@end
@implementation ZLSingleSectionController
- (instancetype)initItemsCount:(ZLItemsCountBlock)itemsCountBlock itemSize:(ZLSizeBlock)sizeBlock dequeueReusableCell:(ZLCellBlock)cellBlock selectCellItem:(ZLDidSelectCellBlock)selectCellBlock{
    ZLSingleSectionController *sc = [[self.class alloc] init];
    sc.itemsCountBlock = itemsCountBlock;
    sc.sizeBlock = sizeBlock;
    sc.cellBlock = cellBlock;
    sc.selectBlock = selectCellBlock;
    
    return sc;
}
- (instancetype)initItemsCount:(ZLItemsCountBlock)itemsCountBlock itemSize:(ZLSizeBlock)sizeBlock dequeueReusableCell:(ZLCellBlock)cellBlock supplementary:(ZLSupplementaryBlock)supplementaryBlock selectCellItem:(ZLDidSelectCellBlock)selectCellBlock {
    ZLSingleSectionController *sc = [self initItemsCount:itemsCountBlock itemSize:sizeBlock dequeueReusableCell:cellBlock selectCellItem:selectCellBlock];
    sc.supplementaryBlock = supplementaryBlock;
    return sc;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.itemsCountBlock) {
        return self.itemsCountBlock(self,collectionView,section);
    }
    return [super collectionView:collectionView numberOfItemsInSection:section];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sizeBlock) {
        return self.sizeBlock(self,collectionView,indexPath);
    }
    return [super collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellBlock) {
        return self.cellBlock(self,collectionView,indexPath);
    }
    return [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectBlock) {
        self.selectBlock(self, collectionView, indexPath);
    }else {
        [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (self.supplementaryBlock) {
        return self.supplementaryBlock(self,collectionView,kind,indexPath);
    }
    return [super collectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath];
}
@end
