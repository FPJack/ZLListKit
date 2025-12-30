//
//  ZLItemController.m
//  GMListKit
//
//  Created by 卿之 on 2024/4/24.
//

#import "ZLItemController.h"
#import "ZLItemsSectionController.h"

@implementation ZLItemController
- (CGFloat)collectionView:(UICollectionView *)collectionView width:(CGFloat)width heightForItem:(NSInteger)item{
    return width;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return UICollectionViewCell.new;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
}
@end
