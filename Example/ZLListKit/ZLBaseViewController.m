//
//  ZLBaseViewController.m
//  ZLListKit_Example
//
//  Created by 卿之 on 2024/5/14.
//  Copyright © 2024 fanpeng. All rights reserved.
//

#import "ZLBaseViewController.h"

@interface ZLBaseViewController ()
@property (nonatomic,strong,readwrite)ZLCollectionView *collectionView;

@end

@implementation ZLBaseViewController

- (ZLMutableArray<ZLSectionController *> *)sectionControllers {
    if (!_sectionControllers ) {
        _sectionControllers = ZLMutableArray.new;
    }
    return _sectionControllers;
}
- (ZLCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [ZLCollectionView  initWithFrame:self.view.bounds collectionViewLayout:nil];
        _collectionView.viewController = self;
        _collectionView.listSectonControllerDataSource = self;
        _collectionView.scrollViewDelegate = self;
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    self.collectionView.frame = self.view.bounds;
}



#pragma mark - GMListSectionControllerDataSource

- (ZLMutableArray<ZLSectionController *> *)sectionControllersForCollectionView:(ZLCollectionView *)collectionView{
    return self.sectionControllers;
}
- (id)objectForSectionController:(ZLSectionController *)sectionController {
    return sectionController.sectionDatas ? sectionController.sectionDatas(sectionController) : nil;
}
- (int)sortedSectionControllersByTagForCollectionView:(ZLCollectionView *)collectionView {
    return 1;
}

- (UIView *)emptyViewForCollectionView:(ZLCollectionView *)collectionView {
    UILabel *label = UILabel.new;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"无数据";
    return label;
}

@end
