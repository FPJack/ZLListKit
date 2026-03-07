//
//  ZLItemsSectionController.h
//  ZLListKit
//
//  Created by 卿之 on 2024/4/24.
//

#import <Foundation/Foundation.h>
#import "ZLSectionController.h"
#import "ZLItemController.h"
#import "ZLMutableArray.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZLItemsSectionController<__covariant ObjectType> : ZLSectionController<ObjectType>
@property (nonatomic,strong)ZLMutableArray<ZLItemController *> *itemControllers;
- (void)reloadItemController:(ZLItemController *)itemController;
- (void)reloadItemController:(ZLItemController *)itemController animation:(BOOL)animation completion:(void(^)(BOOL finished))completion;
@end

NS_ASSUME_NONNULL_END
