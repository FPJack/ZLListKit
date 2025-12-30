//
//  ZLItemController.h
//  ZLListKit
//
//  Created by 卿之 on 2024/4/24.
//

#import <Foundation/Foundation.h>
#import "ZLBaseController.h"

@class ZLItemsSectionController;
NS_ASSUME_NONNULL_BEGIN

@interface ZLItemController : ZLBaseController
@property (nonatomic,weak)ZLItemsSectionController *sectionController;
/// 获取item的高度
/// - Parameters:
///   - collectionView: collectionview
///   - width: item的宽度，根据collectionview 的宽 减去sectionInset 和 columnSpace 再除以列数，得出item的宽度
///   - item: collectionview
- (CGFloat)collectionView:(UICollectionView *)collectionView width:(CGFloat)width heightForItem:(NSInteger)item;

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
