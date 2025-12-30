//
//  ZLSingleSectionController.m
//  HCGitModule_Example
//
//  Created by 卿之 on 2024/4/18.
//  Copyright © 2024 范鹏. All rights reserved.
//

#import "ZLSingleSectionController.h"
@interface ZLSingleSectionController()
@property (nonatomic,copy)GMItemsCountBlock itemsCountBlock;
@property (nonatomic,copy)GMSizeBlock sizeBlock;
@property (nonatomic,copy)GMCellBlock cellBlock;
@property (nonatomic,copy)GMDidSelectCellBlock selectBlock;
@property (nonatomic,copy)GMSupplementaryBlock supplementaryBlock;
@end
@implementation ZLSingleSectionController
- (instancetype)initItemsCount:(GMItemsCountBlock)itemsCountBlock itemSize:(GMSizeBlock)sizeBlock dequeueReusableCell:(GMCellBlock)cellBlock selectCellItem:(GMDidSelectCellBlock)selectCellBlock{
    ZLSingleSectionController *sc = [[self.class alloc] init];
    sc.itemsCountBlock = itemsCountBlock;
    sc.sizeBlock = sizeBlock;
    sc.cellBlock = cellBlock;
    sc.selectBlock = selectCellBlock;
    
    return sc;
}
- (instancetype)initItemsCount:(GMItemsCountBlock)itemsCountBlock itemSize:(GMSizeBlock)sizeBlock dequeueReusableCell:(GMCellBlock)cellBlock supplementary:(GMSupplementaryBlock)supplementaryBlock selectCellItem:(GMDidSelectCellBlock)selectCellBlock {
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
