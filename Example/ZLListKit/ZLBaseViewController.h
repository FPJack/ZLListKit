//
//  ZLBaseViewController.h
//  ZLListKit_Example
//
//  Created by 卿之 on 2024/5/14.
//  Copyright © 2024 fanpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZLListKit/ZLListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLBaseViewController : UIViewController<ZLListSectionControllerDataSource,UIScrollViewDelegate>
@property (nonatomic,strong,readonly)ZLCollectionView *collectionView;
@property (nonatomic,strong)ZLMutableArray<ZLSectionController *> *sectionControllers;
@end

NS_ASSUME_NONNULL_END
