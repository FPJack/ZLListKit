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



@interface GMSafeMutableArray()
@property  (nonatomic,strong)NSMutableArray *arr;
@end

@implementation GMSafeMutableArray


- (instancetype)init {
    return self;
}
- (instancetype)initWithCapacity:(NSUInteger)numItems {
    self.arr = [[NSMutableArray alloc] initWithCapacity:numItems];
    return self;
}

- (instancetype)initWithArray:(NSArray *)array {
    self.arr = [[NSMutableArray alloc] initWithArray:array];

    return self;
}

- (instancetype)initWithObjects:(const id[])objects count:(NSUInteger)cnt {
    self.arr = [[NSMutableArray alloc] initWithObjects:objects count:cnt];
    return self;
}

- (instancetype)initWithContentsOfFile:(NSString *)path {
    self.arr = [[NSMutableArray alloc] initWithContentsOfFile:path];
    return self;
}

- (instancetype)initWithContentsOfURL:(NSURL *)url {
    self.arr = [[NSMutableArray alloc] initWithContentsOfURL:url];
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.arr;
}
- (void)addObject:(id)anObject {
    if (anObject) {
        [self.arr addObject:anObject];
    }
}
- (void)removeObject:(id)anObject {
    [self.arr removeObject:anObject];
}
- (void)removeAllObjects {
    [self.arr removeAllObjects];
}
- (void)removeLastObject {
    [self.arr removeLastObject];
}
- (void)removeObjectsInArray:(NSArray *)otherArray {
    [self.arr removeObjectsInArray: otherArray];
}
- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.arr removeObjectAtIndex:index];
}
- (void)addObjectsFromArray:(NSArray *)otherArray {
    if (otherArray) {
        [self.arr addObjectsFromArray:otherArray];
    }
}
- (id)objectAtIndex:(NSUInteger)index {
    if (index < self.arr.count) return self.arr[index];
    return nil;
}
- (NSUInteger)count {
    return self.arr.count;
}
@end
