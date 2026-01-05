//
//  ZLMutableArray.m
//  ZLListKit
//
//  Created by 卿之 on 2024/4/25.
//

#import "ZLMutableArray.h"
#import "ZLBaseController.h"
@interface ZLMutableArray()<NSCopying,NSMutableCopying>
@property (nonatomic,strong)NSMutableArray<ZLBaseController *> *datas;
@end
@implementation ZLMutableArray

- (id)copyWithZone:(NSZone *)zone {
    ZLMutableArray *copy = [[[self class] allocWithZone:zone] init];
    copy.datas = [self.datas mutableCopy];
    return copy;
}
- (id)mutableCopyWithZone:(nullable NSZone *)zone{
    ZLMutableArray *copy = [[[self class] allocWithZone:zone] init];
    copy.datas = [self.datas mutableCopy];
    return copy;
}
static BOOL _isBaseContoller(NSObject *controller) {
    return controller && [controller isKindOfClass:ZLBaseController.class];
}
- (ZLMutableArray *)sortedSectionControllerDatas:(BOOL )ascending{
    [self.datas sortUsingComparator:^NSComparisonResult(ZLBaseController *  _Nonnull obj1, ZLBaseController *  _Nonnull obj2) {
        return ascending ? obj1.tag > obj2.tag : obj1.tag < obj2.tag;
    }];
    return self;
}
- (NSMutableArray<ZLBaseController *> *)datas {
    if (!_datas) {
        _datas = NSMutableArray.array;
    }
    return _datas;
}

- (ZLBaseController *)getObjectByTag:(NSInteger )tag {
   __block ZLBaseController *sc = nil;
     [self.datas enumerateObjectsUsingBlock:^(ZLBaseController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == tag) {
            sc = obj;
            *stop = YES;
        }
    }];
    return sc;
}
- (ZLBaseController *)removeObjectByTag:(NSInteger )tag {
    __block ZLBaseController *sc = nil;
    [self.datas enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(ZLBaseController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.tag == tag) {
            sc = obj;
            [self removeObject:obj];
            *stop = YES;
        }
    }];
    return sc;
}
- (NSUInteger )firstObjectIndexByTag:(NSInteger )tag {
    for (int i = 0; i < self.datas.count; i ++) {
        ZLBaseController *sc = [self objectAtIndex:i];
        if (sc.tag == tag) {
            return i;
        }
    }
    return NSNotFound;
}

- (void)addObject:(ZLBaseController *)object {
    if (!_isBaseContoller(object)) return;
    [self.datas addObject:object];
}
- (void)addOrUpdateObject:(ZLBaseController* )object {
    if (!_isBaseContoller(object)) return;
    [self removeObjectByTag:object.tag];
    [self.datas addObject:object];
}
- (void)insertObject:(ZLBaseController *)object atIndex:(NSUInteger)idx{
    if (!_isBaseContoller(object)) return;
    [self.datas insertObject:object atIndex:idx];
}
- (void)removeObject:(ZLBaseController *)object {
    if (!_isBaseContoller(object)) return;
    return [self.datas removeObject:object];
}
- (void)removeAllObjects {
    [self.datas removeAllObjects];
}
- (ZLBaseController *)lastObject {
    return self.datas.lastObject;
}
- (ZLBaseController *)firstObject {
    return self.datas.firstObject;
}
- (ZLBaseController *)objectAtIndex:(NSUInteger)idx {
    return [self.datas objectAtIndex:idx];;
}
- (NSUInteger)indexOfObject:(ZLBaseController *)object {
    return [self.datas indexOfObject:object];
}
- (NSUInteger)count {

    return self.datas.count;
}

@end


