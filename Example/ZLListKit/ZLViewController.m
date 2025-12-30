//
//  ZLViewController.m
//  ZLListKit
//
//  Created by fanpeng on 12/30/2025.
//  Copyright (c) 2025 fanpeng. All rights reserved.
//

#import "ZLViewController.h"
#import <ZLListKit//ZLListKit.h>
#import <Masonry/Masonry.h>
#import "ZLItemsVC.h"

@interface ZLViewController ()

@end

@implementation ZLViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = UIColor.clearColor;
    self.view.backgroundColor = UIColor.lightGrayColor;
    
    {
        ZLSingleSectionController *sc = [[ZLSingleSectionController alloc] initItemsCount:^NSInteger(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSInteger section) {
            return 1;
        } itemSize:^CGSize(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            return CGSizeMake(sectionController.columnWidth, 50);
        } dequeueReusableCell:^UICollectionViewCell * _Nullable(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
           ZLCollectionViewCell *cell = [(ZLCollectionView *)collectionView dequeueReusableCellOfClass:ZLCollectionViewCell.class withReuseIdentifier:ZLCollectionViewCell.gm_reuseIdentifier indexPath:indexPath];
           return [[cell initAfter:^(ZLCollectionViewCell * _Nonnull cell) {
               [cell.contentView addSubview:cell.label1];
               cell.label1.text = @"GMSectionController用法";
               cell.contentView.backgroundColor = UIColor.whiteColor;
          }] hookLayoutSubviews:^(ZLCollectionViewCell * _Nonnull cell) {
              cell.label1.frame = cell.bounds;
          }];
        } supplementary:^UICollectionReusableView * _Nullable(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSString * _Nonnull kind, NSIndexPath * _Nonnull indexPath) {
            ZLCollectionReusableView *view = [(ZLCollectionView *)collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ZLCollectionReusableView.gm_reuseIdentifier viewClass:ZLCollectionReusableView.class indexPath:indexPath];

            return view;
        } selectCellItem:^(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            
        }];
        sc.footerHeight = 20;
        sc.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        [self.sectionControllers addObject:sc];
    }
    
    
    {
        ZLSingleSectionController *sc = [[ZLSingleSectionController alloc] initItemsCount:^NSInteger(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSInteger section) {
            return 1;
        } itemSize:^CGSize(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            return CGSizeMake(sectionController.columnWidth, 50);
        } dequeueReusableCell:^UICollectionViewCell * _Nullable(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
           ZLCollectionViewCell *cell = [(ZLCollectionView *)collectionView dequeueReusableCellOfClass:ZLCollectionViewCell.class withReuseIdentifier:ZLCollectionViewCell.gm_reuseIdentifier indexPath:indexPath];
           return [[cell initAfter:^(ZLCollectionViewCell * _Nonnull cell) {
               [cell.contentView addSubview:cell.label1];
               cell.label1.text = @"GMSectionController用法";
               cell.imgView1.image = [UIImage imageNamed:@""];
               [cell.contentView addSubview:cell.imgView1];
               cell.contentView.backgroundColor = UIColor.whiteColor;

          }] hookLayoutSubviews:^(ZLCollectionViewCell * _Nonnull cell) {
              cell.label1.frame = cell.bounds;
              cell.imgView1.frame = CGRectMake(30, 30, 30, 30);
          }];
        } supplementary:^UICollectionReusableView * _Nullable(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSString * _Nonnull kind, NSIndexPath * _Nonnull indexPath) {
          ZLCollectionReusableView *view = [(ZLCollectionView *)collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ZLCollectionReusableView.gm_reuseIdentifier viewClass:ZLCollectionReusableView.class indexPath:indexPath];
           return [[view initAfter:^(ZLCollectionReusableView * _Nonnull view) {
               [view addSubview:view.label1];
               view.backgroundColor = UIColor.grayColor;
               view.label1.text = @"header";
               [view.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.edges.mas_equalTo(0);
               }];
               view.backgroundColor = UIColor.whiteColor;
               if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
                   view.label1.text = @"header";
               }else {
                   view.label1.text = @"footer";
               }
          }] hookLayoutSubviews:^(ZLCollectionReusableView * _Nonnull view) {
              if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
                  [ view roundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadius:10];
              }else {
                  [ view roundedCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight withRadius:10];
              }
          }];
            
        } selectCellItem:^(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            
        }];
        sc.headerHeight = 30;
        sc.footerHeight = 50;
        sc.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        sc.headerInset = UIEdgeInsetsMake(0, 10, 0, 10);
        sc.footerInset = UIEdgeInsetsMake(0, 10, 0, 10);

        [self.sectionControllers addObject:sc];
    }
    
    
    {
        ZLSingleSectionController *sc = [[ZLSingleSectionController alloc] initItemsCount:^NSInteger(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSInteger section) {
            return 1;
        } itemSize:^CGSize(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            return CGSizeMake(sectionController.columnWidth, 50);
        } dequeueReusableCell:^UICollectionViewCell * _Nullable(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
           ZLCollectionViewCell *cell = [(ZLCollectionView *)collectionView dequeueReusableCellOfClass:ZLCollectionViewCell.class withReuseIdentifier:ZLCollectionViewCell.gm_reuseIdentifier indexPath:indexPath];
           return [[cell initAfter:^(ZLCollectionViewCell * _Nonnull cell) {
               [cell.contentView addSubview:cell.label1];
               cell.label1.text = @"GMSectionController用法";
               cell.contentView.backgroundColor = UIColor.whiteColor;

          }] hookLayoutSubviews:^(ZLCollectionViewCell * _Nonnull cell) {
              cell.label1.frame = cell.bounds;
          }];
        } supplementary:^UICollectionReusableView * _Nullable(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSString * _Nonnull kind, NSIndexPath * _Nonnull indexPath) {
            ZLCollectionReusableView *view = [(ZLCollectionView *)collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ZLCollectionReusableView.gm_reuseIdentifier viewClass:ZLCollectionReusableView.class indexPath:indexPath];

            return view;
        } selectCellItem:^(ZLSingleSectionController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            
        }];
        sc.headerHeight = 20;
        sc.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        [self.sectionControllers addObject:sc];
    }
    

    
    
  
    
    {
        ZLItemsVC *sectionVC = [[ZLItemsVC alloc] init];
        
       
        {
            ZLItemController *item = [[ZLSingleItemController alloc] initItemHeight:^CGFloat(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSInteger item, CGFloat width) {
                return 50;
            } dequeueReusableCell:^UICollectionViewCell * _Nullable(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
                ZLCollectionViewCell *cell = [(ZLCollectionView *)collectionView dequeueReusableCellOfClass:ZLCollectionViewCell.class withReuseIdentifier:ZLCollectionViewCell.gm_reuseIdentifier indexPath:indexPath];
                cell.label1.text = @"item1";
                cell.label1.frame = CGRectMake(0, 0, 200, 50);
                cell.contentView.backgroundColor = UIColor.greenColor;

                return cell;
            } selectCellItem:^(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            }];
            [sectionVC.itemControllers addObject:item];
        }
        
        {
            ZLItemController *item = [[ZLSingleItemController alloc] initItemHeight:^CGFloat(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSInteger item, CGFloat width) {
                return 50;
            } dequeueReusableCell:^UICollectionViewCell * _Nullable(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
                ZLCollectionViewCell *cell = [(ZLCollectionView *)collectionView dequeueReusableCellOfClass:ZLCollectionViewCell.class withReuseIdentifier:ZLCollectionViewCell.gm_reuseIdentifier indexPath:indexPath];
                cell.label1.text = @"item2";
                cell.label1.frame = CGRectMake(0, 0, 200, 50);
                cell.contentView.backgroundColor = UIColor.redColor;
                return cell;
            } selectCellItem:^(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            }];
            [sectionVC.itemControllers addObject:item];
        }
        
        {
            ZLItemController *item = [[ZLSingleItemController alloc] initItemHeight:^CGFloat(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSInteger item, CGFloat width) {
                return 50;
            } dequeueReusableCell:^UICollectionViewCell * _Nullable(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
                ZLCollectionViewCell *cell = [(ZLCollectionView *)collectionView dequeueReusableCellOfClass:ZLCollectionViewCell.class withReuseIdentifier:ZLCollectionViewCell.gm_reuseIdentifier indexPath:indexPath];
                cell.label1.text = @"item3";
                cell.label1.frame = CGRectMake(0, 0, 200, 50);
                cell.contentView.backgroundColor = UIColor.orangeColor;
                return cell;
            } selectCellItem:^(ZLSingleItemController * _Nonnull sectionController, UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
                
            }];
            [sectionVC.itemControllers addObject:item];
        }
        sectionVC.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        sectionVC.headerInset = UIEdgeInsetsMake(10, 10, 0, 10);
        sectionVC.footerInset = UIEdgeInsetsMake(0, 10, 0, 10);
        [self.sectionControllers addObject:sectionVC];
    }
    
}
@end
