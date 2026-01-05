//
//  ZLSingleItemController.m
//  ZLListKit
//
//  Created by 卿之 on 2024/4/25.
//

#import "ZLSingleItemController.h"
@interface ZLSingleItemController()
@property (nonatomic,copy)ZLItemHeight itemHeightBlock;
@property (nonatomic,copy)ZLItemCell itemCellBlock;
@property (nonatomic,copy)ZLItemSelectCell selectCellBlock;
@end
@implementation ZLSingleItemController
- (instancetype)initItemHeight:(ZLItemHeight)itemHeightBlock dequeueReusableCell:(ZLItemCell)itemCellBlock selectCellItem:(ZLItemSelectCell)selectCellBlock {
    ZLSingleItemController *sc = [[self.class alloc] init];
    sc.itemHeightBlock = itemHeightBlock;
    sc.itemCellBlock = itemCellBlock;
    sc.selectCellBlock = selectCellBlock;
    return sc;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView width:(CGFloat)width heightForItem:(NSInteger)item {
    if (self.itemHeightBlock) {
       return self.itemHeightBlock(self, collectionView, item,width);
    }else {
       return  [super collectionView:collectionView width:width heightForItem:item];
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.itemCellBlock) {
        return self.itemCellBlock(self, collectionView, indexPath);
    }else {
        return [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectCellBlock) {
        self.selectCellBlock(self, collectionView, indexPath);
    }else {
        [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}
@end
