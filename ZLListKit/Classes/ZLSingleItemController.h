//
//  ZLSingleItemController.h
//  ZLListKit
//
//  Created by 卿之 on 2024/4/25.
//

#import "ZLItemController.h"
@class ZLSingleItemController;
NS_ASSUME_NONNULL_BEGIN
typedef CGFloat (^ZLItemHeight)(ZLSingleItemController *sectionController,UICollectionView * collectionView,NSInteger item,CGFloat width);
typedef UICollectionViewCell* _Nullable (^ZLItemCell)(ZLSingleItemController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);
typedef void (^ZLItemSelectCell)(ZLSingleItemController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);

@interface ZLSingleItemController : ZLItemController
- (instancetype)initItemHeight:(ZLItemHeight)itemHeightBlock dequeueReusableCell:(ZLItemCell)itemCellBlock selectCellItem:(ZLItemSelectCell)selectCellBlock;

@end

NS_ASSUME_NONNULL_END
