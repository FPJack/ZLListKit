//
//  ZLSingleItemController.h
//  ZLListKit
//
//  Created by 卿之 on 2024/4/25.
//

#import "ZLItemController.h"
@class ZLSingleItemController;
NS_ASSUME_NONNULL_BEGIN
typedef CGFloat (^GMItemHeight)(ZLSingleItemController *sectionController,UICollectionView * collectionView,NSInteger item,CGFloat width);
typedef UICollectionViewCell* _Nullable (^GMItemCell)(ZLSingleItemController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);
typedef void (^GMItemSelectCell)(ZLSingleItemController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);

@interface ZLSingleItemController : ZLItemController
- (instancetype)initItemHeight:(GMItemHeight)itemHeightBlock dequeueReusableCell:(GMItemCell)itemCellBlock selectCellItem:(GMItemSelectCell)selectCellBlock;

@end

NS_ASSUME_NONNULL_END
