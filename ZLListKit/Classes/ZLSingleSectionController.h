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

typedef CGSize (^GMSizeBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);
typedef UICollectionViewCell* _Nullable (^GMCellBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);
typedef void (^GMDidSelectCellBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSIndexPath *indexPath);
typedef NSInteger (^GMItemsCountBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSInteger section);
typedef UICollectionReusableView* _Nullable (^GMSupplementaryBlock)(ZLSingleSectionController *sectionController,UICollectionView * collectionView,NSString *kind,NSIndexPath* indexPath);

@interface ZLSingleSectionController : ZLSectionController

- (instancetype)initItemsCount:(GMItemsCountBlock)itemsCountBlock itemSize:(GMSizeBlock)sizeBlock dequeueReusableCell:(GMCellBlock)cellBlock selectCellItem:(GMDidSelectCellBlock)selectCellBlock;
- (instancetype)initItemsCount:(GMItemsCountBlock)itemsCountBlock itemSize:(GMSizeBlock)sizeBlock dequeueReusableCell:(GMCellBlock)cellBlock supplementary:(GMSupplementaryBlock)supplementaryBlock selectCellItem:(GMDidSelectCellBlock)selectCellBlock;

@end

NS_ASSUME_NONNULL_END
