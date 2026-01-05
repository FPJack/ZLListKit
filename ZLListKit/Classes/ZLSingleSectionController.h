//
//  ZLSingleSectionController.h
//  HCGitModule_Example
//
//  Created by 卿之 on 2024/4/18.
//  Copyright © 2024 范鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLSectionController.h"
@class ZLSingleSectionController;
NS_ASSUME_NONNULL_BEGIN

typedef CGSize (^ZLSizeBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);
typedef UICollectionViewCell* _Nullable (^ZLCellBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);
typedef void (^ZLDidSelectCellBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);
typedef NSInteger (^ZLItemsCountBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSInteger section);
typedef UICollectionReusableView* _Nullable (^ZLSupplementaryBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSString *kind,NSIndexPath* indexPath);

@interface ZLSingleSectionController : ZLSectionController

- (instancetype)initItemsCount:(ZLItemsCountBlock)itemsCountBlock itemSize:(ZLSizeBlock)sizeBlock dequeueReusableCell:(ZLCellBlock)cellBlock selectCellItem:(ZLDidSelectCellBlock)selectCellBlock;
- (instancetype)initItemsCount:(ZLItemsCountBlock)itemsCountBlock itemSize:(ZLSizeBlock)sizeBlock dequeueReusableCell:(ZLCellBlock)cellBlock supplementary:(ZLSupplementaryBlock)supplementaryBlock selectCellItem:(ZLDidSelectCellBlock)selectCellBlock;

@end

NS_ASSUME_NONNULL_END
