//
//  ZLItemsVC.m
//  ZLListKit_Example
//
//  Created by Mac on 2025/1/14.
//  Copyright © 2025 fanpeng. All rights reserved.
//

#import "ZLItemsVC.h"

@implementation ZLItemsVC
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    ZLCollectionReusableView *view = [(ZLCollectionView *)collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ZLCollectionReusableView.gm_reuseIdentifier viewClass:ZLCollectionReusableView.class indexPath:indexPath];

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view.label1.text = @"header";
    }else {
        view.label1.text = @"footer";

    }
    view.label1.frame = CGRectMake(0, 0, 100, 30);
    return view;
}
- (CGFloat)headerHeight {
    return 30;
}
- (CGFloat)footerHeight {
    return 30;
}
@end
