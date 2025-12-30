//
//  ZLCollectionView.h
//  HCGitModule_Example
//
//  Created by 卿之 on 2024/4/19.
//  Copyright © 2024 范鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSectionController.h"
#import "ZLMutableArray.h"
@class ZLCollectionView;


NS_ASSUME_NONNULL_BEGIN


@protocol ZLListSectionControllerDataSource
@required

/// 返回ZLSectionController 数组
/// - Parameter collectionView: collectionView
- (ZLMutableArray<ZLSectionController *> *)sectionControllersForCollectionView:(ZLCollectionView *)collectionView;
@optional

/// 空数据展示页面
/// - Parameter collectionView: collectionView
- (UIView *)emptyViewForCollectionView:(ZLCollectionView *)collectionView;

/// 返回每组SectionController 对应的datas，和sectionDatas二选一，该方法优先级高于sectionDatas
/// - Parameter sectionController: sectionController
- (id)objectForSectionController:(ZLSectionController *)sectionController;


/// 根据tag值升降序排序sectionControllers  返回值  1: 升序  ，-1: 降序，0: 不排序
/// - Parameter collectionView: collectionView
- (int)sortedSectionControllersByTagForCollectionView:(ZLCollectionView *)collectionView;



@end
@interface ZLCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong,readonly)ZLMutableArray<ZLSectionController *> *sectionControllers;
@property (nonatomic,weak)UIViewController *viewController;
@property (nonatomic,weak)id <ZLListSectionControllerDataSource> listSectonControllerDataSource;
@property (nonatomic,weak)id <UIScrollViewDelegate> scrollViewDelegate;
+ (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nullable UICollectionViewLayout  * )layout;





/// 内部自动注册Cell
/// - Parameters:
///   - cellClass: <#cellClass description#>
///   - reuseIdentifier: <#reuseIdentifier description#>
///   - indexPath: <#indexPath description#>
- (__kindof UICollectionViewCell *)dequeueReusableCellOfClass:(Class)cellClass
                                          withReuseIdentifier:(nullable NSString *)reuseIdentifier
                                                    indexPath:(NSIndexPath *)indexPath;




///  内部自动注册Cell
/// - Parameters:
///   - nibName: <#nibName description#>
///   - bundle: <#bundle description#>
///   - reuseIdentifier: <#reuseIdentifier description#>
///   - indexPath: <#indexPath description#>
- (__kindof UICollectionViewCell *)dequeueReusableCellWithNibName:(NSString *)nibName
                                                           bundle:(nullable NSBundle *)bundle
                                                           withReuseIdentifier:(nullable NSString *)reuseIdentifier
                                                        indexPath:(NSIndexPath *)indexPath ;

 





/// 内部自动注册SupplementaryView
/// - Parameters:
///   - elementKind: <#elementKind description#>
///   - reuseIdentifier: <#reuseIdentifier description#>
///   - viewClass: <#viewClass description#>
///   - indexPath: <#indexPath description#>
- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind
                                                          withReuseIdentifier:(NSString *)reuseIdentifier
                                                                        viewClass:(Class)viewClass
                                                                        indexPath:(NSIndexPath *)indexPath ;



/// 内部自动注册SupplementaryView
/// - Parameters:
///   - elementKind: <#elementKind description#>
///   - reuseIdentifier: <#reuseIdentifier description#>
///   - nibName: <#nibName description#>
///   - bundle: <#bundle description#>
///   - indexPath: <#indexPath description#>
- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind
                                                          withReuseIdentifier:(NSString *)reuseIdentifier
                                                                      nibName:(NSString *)nibName
                                                                       bundle:(nullable NSBundle *)bundle
                                                                    indexPath:(NSIndexPath *)indexPath ;


@end

NS_ASSUME_NONNULL_END
