//
//  ZLCollectionView.m
//  HCGitModule_Example
//
//  Created by 卿之 on 2024/4/19.
//  Copyright © 2024 范鹏. All rights reserved.
//

#import "ZLCollectionView.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface ZLCollectionView()<CHTCollectionViewDelegateWaterfallLayout,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong,readwrite)ZLMutableArray<ZLSectionController *> *sectionControllers;
@property (nonatomic,strong)NSMutableDictionary *registerSupplementaryViewsDic;
@property (nonatomic,strong)NSMutableDictionary *registerCellsDic;

@end
@implementation ZLCollectionView
+ (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (!layout) {
        CHTCollectionViewWaterfallLayout* waterLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
        waterLayout.itemRenderDirection = CHTCollectionViewWaterfallLayoutItemRenderDirectionShortestFirst;
        layout = waterLayout;
    }
    
    ZLCollectionView* collectionView = [[ZLCollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.delegate = collectionView;
    collectionView.dataSource = collectionView;
    collectionView.backgroundColor = UIColor.clearColor;
    collectionView.registerSupplementaryViewsDic = NSMutableDictionary.dictionary;
    collectionView.registerCellsDic = NSMutableDictionary.dictionary;
    return collectionView;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return [[self.sectionControllers objectAtIndex:indexPath.section] collectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath];
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.sectionControllers objectAtIndex:indexPath.section] collectionView:collectionView cellForItemAtIndexPath:indexPath];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionControllers.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    ZLSectionController *sc = [self.sectionControllers objectAtIndex:section];
    [sc setValue:@(section) forKey:@"section"];
    return [sc collectionView:collectionView numberOfItemsInSection:section];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section {
    return [[self.sectionControllers objectAtIndex:section] collectionView:collectionView layout:collectionViewLayout columnCountForSection:section];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.sectionControllers objectAtIndex:indexPath.section] collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [[self.sectionControllers objectAtIndex:indexPath.section] collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section {
    return [[self.sectionControllers objectAtIndex:section] collectionView:collectionView layout:collectionViewLayout heightForHeaderInSection:section];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section {
    return [[self.sectionControllers objectAtIndex:section] collectionView:collectionView layout:collectionViewLayout heightForFooterInSection:section];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumColumnSpacingForSectionAtIndex:(NSInteger)section {
    return [[self.sectionControllers objectAtIndex:section] collectionView:collectionView layout:collectionViewLayout minimumColumnSpacingForSectionAtIndex:section];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return [[self.sectionControllers objectAtIndex:section] collectionView:collectionView layout:collectionViewLayout minimumInteritemSpacingForSectionAtIndex:section];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return [[self.sectionControllers objectAtIndex:section] collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:section];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForHeaderInSection:(NSInteger)section {
    return [[self.sectionControllers objectAtIndex:section] collectionView:collectionView layout:collectionViewLayout insetForHeaderInSection:section];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForFooterInSection:(NSInteger)section {
    return [[self.sectionControllers objectAtIndex:section]collectionView:collectionView layout:collectionViewLayout insetForFooterInSection:section];
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    [[self.sectionControllers objectAtIndex:indexPath.section] collectionView:collectionView didDeselectItemAtIndexPath:indexPath];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.bounds.size.width, [self collectionView:collectionView layout:collectionViewLayout heightForHeaderInSection:section]);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(self.bounds.size.width, [self collectionView:collectionView layout:collectionViewLayout heightForFooterInSection:section]);
}
- (__kindof UICollectionViewCell *)dequeueReusableCellOfClass:(Class)cellClass
                                          withReuseIdentifier:(nullable NSString *)reuseIdentifier
                                                      indexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    if (!self.registerCellsDic[reuseIdentifier]) {
        [self registerClass:cellClass forCellWithReuseIdentifier:reuseIdentifier];
        self.registerCellsDic[reuseIdentifier] = NSStringFromClass(cellClass);
    }
    cell = [self dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}
- (__kindof UICollectionViewCell *)dequeueReusableCellWithNibName:(NSString *)nibName
                                                           bundle:(nullable NSBundle *)bundle
                                                           withReuseIdentifier:(nullable NSString *)reuseIdentifier
                                                           indexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = nil;
    NSString *registerKey = [NSString stringWithFormat:@"%@-%@-%@",nibName,bundle,reuseIdentifier];
    if (!self.registerCellsDic[registerKey]) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:bundle] forCellWithReuseIdentifier:reuseIdentifier];
        self.registerCellsDic[reuseIdentifier] = registerKey;
    }
    cell = [self dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}
- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind
                                                          withReuseIdentifier:(NSString *)reuseIdentifier
                                                                    viewClass:(Class)viewClass
                                                                      indexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = nil;
    NSString *registerKey = [NSString stringWithFormat:@"%@-%@",elementKind,reuseIdentifier];
    if (!self.registerSupplementaryViewsDic[registerKey]) {
        [self registerClass:viewClass forSupplementaryViewOfKind:elementKind withReuseIdentifier:reuseIdentifier];
        self.registerSupplementaryViewsDic[registerKey] = NSStringFromClass(viewClass);
    }
    view = [self dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return view;
}
- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind
                                                          withReuseIdentifier:(NSString *)reuseIdentifier
                                                                      nibName:(NSString *)nibName
                                                                       bundle:(nullable NSBundle *)bundle
                                                                      indexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionReusableView *view = nil;
    NSString *registerKey = [NSString stringWithFormat:@"%@-%@-%@-%@",nibName,bundle,elementKind,reuseIdentifier];
    if (!self.registerSupplementaryViewsDic[registerKey]) {
        [self registerNib:[UINib nibWithNibName:nibName bundle:bundle] forCellWithReuseIdentifier:reuseIdentifier];
        self.registerSupplementaryViewsDic[registerKey] = registerKey;
    }
    view = [self dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return view;
}

- (void)reloadData {
    if ([(NSObject *)self.listSectonControllerDataSource respondsToSelector:@selector(sectionControllersForCollectionView:)]) {
        self.sectionControllers = [[self.listSectonControllerDataSource sectionControllersForCollectionView:self] mutableCopy];
    }
    if ([(NSObject *)self.listSectonControllerDataSource respondsToSelector:@selector(sortedSectionControllersByTagForCollectionView:)]) {
        int res = [self.listSectonControllerDataSource sortedSectionControllersByTagForCollectionView:self];
        if (res != 0) [self.sectionControllers sortedSectionControllerDatas: res > 0];
    }
    for (int  i = 0; i < self.sectionControllers.count; i++) {
        ZLSectionController *obj = [self.sectionControllers objectAtIndex:i];
        [obj setValue:self.viewController forKey:@"viewController"];
        [obj setValue:self forKey:@"collectionView"];
        [obj didUpdateData];
    }
    [self refreshEmptyView];
    [super reloadData];
}
- (void)refreshEmptyView {
    int tag = 101;
    [[self viewWithTag:tag] removeFromSuperview];
    if (!self.sectionControllers || self.sectionControllers.count == 0) {
        if (![(NSObject *)self.listSectonControllerDataSource respondsToSelector:@selector(emptyViewForCollectionView:)]) return;
        UIView *emptyView = [self.listSectonControllerDataSource emptyViewForCollectionView:self];
        emptyView.tag = tag;
        [self addSubview:emptyView];
        emptyView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:@[
            [NSLayoutConstraint constraintWithItem:emptyView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
            [NSLayoutConstraint constraintWithItem:emptyView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0],
            [NSLayoutConstraint constraintWithItem:emptyView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0],
            [NSLayoutConstraint constraintWithItem:emptyView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]
        ]];
    }
}
- (CGSize)contentSize {
    return [self.collectionViewLayout isKindOfClass:CHTCollectionViewWaterfallLayout.class] ? self.collectionViewLayout.collectionViewContentSize :
     super.contentSize ;
}

#pragma mark - scrollviewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewDidScroll:scrollView];

}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewDidZoom:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewWillBeginDragging:scrollView];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewWillBeginDecelerating:scrollView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewDidEndScrollingAnimation:scrollView];
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return nil;
    return [self.scrollViewDelegate viewForZoomingInScrollView:scrollView];
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewWillBeginZooming:scrollView withView:view];
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
}

//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
//    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
//    [self.scrollViewDelegate scrollViewShouldScrollToTop:scrollView];
//}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    [self.scrollViewDelegate scrollViewDidScrollToTop:scrollView];
}
- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView {
    if (![self.scrollViewDelegate respondsToSelector:_cmd]) return;
    if (@available(iOS 11.0, *)) {
        [self.scrollViewDelegate scrollViewDidChangeAdjustedContentInset:scrollView];
    } else {
    }
}

@end
