//
//  ZLItemsSectionController.m
//  GMListKit
//
//  Created by 卿之 on 2024/4/24.
//

#import "ZLItemsSectionController.h"
#import "ZLItemController.h"
#import "ZLCollectionView.h"
@implementation ZLItemsSectionController
- (ZLMutableArray<ZLItemController *> *)itemControllers {
    if (!_itemControllers) {
        _itemControllers = ZLMutableArray.new;
    }
    return _itemControllers;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemControllers.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLItemController *itemController = [self.itemControllers objectAtIndex:indexPath.item];
    itemController.sectionController = self;
    return [itemController collectionView:collectionView cellForItemAtIndexPath:indexPath];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat itemHeight = [[self.itemControllers objectAtIndex:indexPath.item] collectionView:collectionView width:self.columnWidth heightForItem:indexPath.item];
    return CGSizeMake(self.columnWidth, itemHeight);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    [[self.itemControllers objectAtIndex:indexPath.item] collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}
@end
