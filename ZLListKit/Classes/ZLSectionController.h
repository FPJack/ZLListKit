//
//  ZLSectionController.h
//  HCGitModule_Example
//
//  Created by 卿之 on 2024/4/18.
//  Copyright © 2024 范鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLBaseController.h"
@class ZLCollectionView;

NS_ASSUME_NONNULL_BEGIN

@interface ZLSectionController<__covariant ObjectType> : ZLBaseController

/// sectionDatas block里面返回的数据
@property (nonatomic,strong,readonly)ObjectType datas;
/// 内部datas获取到的数据
@property (nonatomic,copy)ObjectType (^sectionDatas)(ZLSectionController * sectionController);
@property (nonatomic,weak,readonly)UIViewController *viewController;
@property (nonatomic,weak,readonly)ZLCollectionView *collectionView;
@property (nonatomic, assign) CGFloat minimumColumnSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
/// 每一组分几列
@property (nonatomic, assign) NSInteger columnCount;
/// 列宽 !!!!不能在SectionController 初始化里面获取这个宽度，因为这个时候collectionView的contentSize不一定有值
@property (nonatomic,assign,readonly)CGFloat columnWidth;

/// 该组item的高度相等，指定确定的高度
@property (nonatomic,assign)CGFloat itemHeight;

@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign) UIEdgeInsets headerInset;
@property (nonatomic, assign) UIEdgeInsets footerInset;
@property (nonatomic, assign) UIEdgeInsets sectionInset;

@property (nonatomic,strong,readonly)NSArray<NSIndexPath *> *indexPaths;


@property (nonatomic,assign,readonly)NSInteger section;

- (void)reloadSectionController;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
/// 返回组cell的列数
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForHeaderInSection:(NSInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForFooterInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section;
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath;
/// collectionView reloadData的时候会调用，可以在里面拿到最新的datas数据处理
- (void)didUpdateData;

/// 控制器更新的时候调用
/// - Parameter viewController: <#viewController description#>
- (void)didUpdateViewController:(UIViewController *)viewController;

- (ZLSectionController* (^)(CGFloat))gm_minimumColumnSpacing;
- (ZLSectionController* (^)(CGFloat))gm_minimumInteritemSpacing ;
- (ZLSectionController* (^)(NSInteger))gm_columnCount ;
- (ZLSectionController* (^)(CGFloat))gm_itemHeight ;
- (ZLSectionController* (^)(CGFloat))gm_headerHeight ;
- (ZLSectionController* (^)(CGFloat))gm_footerHeight;
- (ZLSectionController* (^)(UIEdgeInsets))gm_headerInset ;
- (ZLSectionController* (^)(UIEdgeInsets))gm_sectionInset ;
- (ZLSectionController* (^)(UIEdgeInsets))gm_footerInset ;
- (ZLSectionController* (^)(NSInteger))gm_tag ;
- (ZLSectionController *)gm_sectionDatas:(ObjectType (^)(ZLSectionController * sc))block ;

@end

NS_ASSUME_NONNULL_END




