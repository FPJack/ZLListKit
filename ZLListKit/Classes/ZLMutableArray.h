//
//  ZLMutableArray.h
//  ZLListKit
//
//  Created by 卿之 on 2024/4/25.
//

#import <Foundation/Foundation.h>
#import "ZLBaseController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZLMutableArray<__covariant ObjectType> : NSObject
- (ObjectType )getObjectByTag:(NSInteger )tag;
- (ObjectType )removeObjectByTag:(NSInteger )tag;
- (NSUInteger )firstObjectIndexByTag:(NSInteger )tag;


- (void)addObject:(ObjectType )object;
- (void)addOrUpdateObject:(ZLBaseController* )object;
- (void)insertObject:(ObjectType )object atIndex:(NSUInteger)idx;

- (void)removeObject:(ObjectType )object;
- (void)removeAllObjects;

- (ObjectType )lastObject;
- (ObjectType )firstObject;
- (ObjectType )objectAtIndex:(NSUInteger)idx ;
- (NSUInteger)indexOfObject:(ObjectType )object;
- (NSUInteger)count;

/// 根据tag值把SectonController进行排序
/// - Parameter ascending: 是否升序
- (ZLMutableArray *)sortedSectionControllerDatas:(BOOL )ascending;
@end






NS_ASSUME_NONNULL_END

