//
//  ZLSectionController.m
//  HCGitModule_Example
//
//  Created by 卿之 on 2024/4/18.
//  Copyright © 2024 范鹏. All rights reserved.
//

#import "ZLSectionController.h"
#import "ZLCollectionView.h"

@interface ZLSectionController()
@property (nonatomic,weak,readwrite)ZLCollectionView *collectionView;
@property (nonatomic,readwrite,strong)id datas;
@property (nonatomic,assign,readwrite)NSInteger section;
@property (nonatomic,weak,readwrite)UIViewController *viewController;

@end
@implementation ZLSectionController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.columnCount = 1;
        self.headerHeight = 0;
        self.footerHeight = 0 ;
        self.headerInset = UIEdgeInsetsZero;
        self.footerInset = UIEdgeInsetsZero;
        self.sectionInset = UIEdgeInsetsZero;
        self.sectionDatas = ^id _Nonnull(ZLSectionController * _Nonnull sectionController) {
            return nil;
        };
    }
    return self;
}
- (CGFloat)columnWidth {
    UIEdgeInsets sectionInset = [self collectionView:self.collectionView layout:self.collectionView.collectionViewLayout insetForSectionAtIndex:self.section];
    CGFloat space = [self collectionView:self.collectionView layout:self.collectionView.collectionViewLayout minimumColumnSpacingForSectionAtIndex:self.section];
//    CGFloat width = MAX(self.collectionView.frame.size.width, self.collectionView.contentSize.width);
    CGFloat width = self.collectionView.frame.size.width;
    NSInteger column = [self collectionView:self.collectionView layout:self.collectionView.collectionViewLayout columnCountForSection:self.section];
    width = (width - sectionInset.left - sectionInset.right - (column - 1) * space) / column;
    return width;
}
- (void)setViewController:(UIViewController *)viewController {
    if (![viewController isEqual:_viewController]) {
        _viewController = viewController;
        [self didUpdateViewController:viewController];
    }else {
        _viewController = viewController;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    @throw [NSException exceptionWithName:@"" reason:@"子类需要实现collectionView:cellForItemAtIndexPath:方法" userInfo:nil];
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section {
    return self.columnCount;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section {
    return self.headerHeight;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForFooterInSection:(NSInteger)section {
    return self.footerInset;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForHeaderInSection:(NSInteger)section {
    return self.headerInset;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return self.sectionInset;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section {
    return self.footerHeight;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.minimumInteritemSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section {
    return self.minimumColumnSpacing;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake(self.columnWidth, self.itemHeight);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{}
- (void)didUpdateData {
    if ([((NSObject *)self.collectionView.listSectonControllerDataSource) respondsToSelector:@selector(objectForSectionController:)]) {
        self.datas = [self.collectionView.listSectonControllerDataSource objectForSectionController:self];
    }else if (self.sectionDatas) {
        self.datas = self.sectionDatas(self);
    }
}
- (void)reloadSectionController {
    if (self.indexPaths.count > 0) {
        [self.collectionView reloadItemsAtIndexPaths:self.indexPaths];
    }
}
- (NSMutableArray<NSIndexPath *> *)indexPaths {
    NSInteger count = [self collectionView:self.collectionView numberOfItemsInSection:self.section];
    NSMutableArray *arr = NSMutableArray.array;
    for (int i = 0; i < count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:self.section];
        [arr addObject:indexPath];
    }
    return arr;
}
- (void)didUpdateViewController:(UIViewController *)viewController {
    
}

- (ZLSectionController* (^)(CGFloat))gm_minimumColumnSpacing {
    return  ^ZLSectionController*(CGFloat minimumColumnSpacing){
        self.minimumColumnSpacing = minimumColumnSpacing;
        return self;
    };
}
- (ZLSectionController* (^)(CGFloat))gm_minimumInteritemSpacing {
    return  ^ZLSectionController*(CGFloat minimumInteritemSpacing){
        self.minimumInteritemSpacing = minimumInteritemSpacing;
        return self;
    };
}
- (ZLSectionController* (^)(NSInteger))gm_columnCount {
    return  ^ZLSectionController*(NSInteger columnCount){
        self.columnCount = columnCount;
        return self;
    };
}
- (ZLSectionController* (^)(CGFloat))gm_itemHeight {
    return  ^ZLSectionController*(CGFloat itemHeight){
        self.itemHeight = itemHeight;
        return self;
    };
}
- (ZLSectionController* (^)(CGFloat))gm_headerHeight {
    return  ^ZLSectionController*(CGFloat headerHeight){
        self.headerHeight = headerHeight;
        return self;
    };
}
- (ZLSectionController* (^)(CGFloat))gm_footerHeight {
    return  ^ZLSectionController*(CGFloat footerHeight){
        self.footerHeight = footerHeight;
        return self;
    };
}
- (ZLSectionController* (^)(UIEdgeInsets))gm_headerInset {
    return  ^ZLSectionController*(UIEdgeInsets inset){
        self.headerInset = inset;
        return self;
    };
}
- (ZLSectionController* (^)(UIEdgeInsets))gm_sectionInset {
    return  ^ZLSectionController*(UIEdgeInsets inset){
        self.sectionInset = inset;
        return self;
    };
}
- (ZLSectionController* (^)(UIEdgeInsets))gm_footerInset {
    return  ^ZLSectionController*(UIEdgeInsets inset){
        self.footerInset = inset;
        return self;
    };
}
- (ZLSectionController* (^)(NSInteger))gm_tag {
    return  ^ZLSectionController*(NSInteger tag){
        self.tag = tag;
        return self;
    };
}

- (ZLSectionController *)gm_sectionDatas:(id (^)(ZLSectionController *sc))block {
    self.sectionDatas = block;
    return self;
}
@end



