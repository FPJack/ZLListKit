//
//  ZLItemController.m
//  ZLListKit
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
- (void)reload{
    [self.sectionController reloadItemController:self];
}
- (void)reloadAnimation:(BOOL)animation completion:(void(^)(BOOL finished))completion{
    [self.sectionController reloadItemController:self animation:animation completion:completion];
}
@end
