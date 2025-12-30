//
//  ZLCollectionViewCell.h
//  ZLListKit
//
//  Created by 卿之 on 2024/4/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLView : UIView
@property (nonatomic,strong)UIStackView *stackView;
@property (nonatomic,strong)UIView *view1;
@property (nonatomic,strong)UIView *view2;
@property (nonatomic,strong)UIView *view3;
@property (nonatomic,strong)UILabel *label1;
@property (nonatomic,strong)UILabel *label2;
@property (nonatomic,strong)UILabel *label3;
@property (nonatomic,strong)UIButton *button1;
@property (nonatomic,strong)UIButton *button2;
@property (nonatomic,strong)UITextField *textField1;
@property (nonatomic,strong)UITextField *textField2;
@property (nonatomic,strong)UIImageView *imgView1;
@property (nonatomic,strong)UIImageView *imgView2;

/// 对象初始化后会保证调用一次，
/// - Parameter block: <#block description#>
- (instancetype)initAfter:(void (^)(ZLView*  view))block;

/// 再次调用initAfter，场景cell复用的时候可刷新资源布局
- (instancetype)invokeInitAfterAgain;

/// 调用layoutSubviews的时候调用
/// - Parameter block: <#block description#>
- (instancetype)hookLayoutSubviews:(void (^)(ZLView *view))block ;

/// 设置圆角，一般在hookLayoutSubview回调里调用
/// - Parameters:
///   - corners: <#corners description#>
///   - radius: <#radius description#>
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;
/// 设置圆角，
/// - Parameters:
///   - corners: <#corners description#>
///   - radius: <#radius description#>
///   - rect: <#rect description#>
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius frame:(CGRect)rect;
- (void)test;
@end


@interface ZLCollectionReusableView : UICollectionReusableView
@property (nonatomic,strong)UIStackView *stackView;
@property (nonatomic,strong)UIView *view1;
@property (nonatomic,strong)UIView *view2;
@property (nonatomic,strong)UIView *view3;
@property (nonatomic,strong)UILabel *label1;
@property (nonatomic,strong)UILabel *label2;
@property (nonatomic,strong)UILabel *label3;
@property (nonatomic,strong)UIButton *button1;
@property (nonatomic,strong)UIButton *button2;
@property (nonatomic,strong)UITextField *textField1;
@property (nonatomic,strong)UITextField *textField2;
@property (nonatomic,strong)UIImageView *imgView1;
@property (nonatomic,strong)UIImageView *imgView2;

/// 再次调用initAfter方法
- (instancetype)invokeInitAfterAgain;
/// cell初始化的时候保证调用一次
/// - Parameter block: <#block description#>
- (instancetype)initAfter:(void (^)(ZLCollectionReusableView*  view))block ;
/// cell复用的使用调用
/// - Parameter block: <#block description#>
- (instancetype)hookPrepareForReuse:(void (^)(ZLCollectionReusableView *view))block;

/// cell布局的时候调用
/// - Parameter block: <#block description#>
- (instancetype)hookLayoutSubviews:(void (^)(ZLCollectionReusableView *view))block;
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius frame:(CGRect)rect;
- (void)test;
@end


@interface ZLCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)UIStackView *stackView;
@property (nonatomic,strong)UIView *view1;
@property (nonatomic,strong)UIView *view2;
@property (nonatomic,strong)UIView *view3;
@property (nonatomic,strong)UILabel *label1;
@property (nonatomic,strong)UILabel *label2;
@property (nonatomic,strong)UILabel *label3;
@property (nonatomic,strong)UIButton *button1;
@property (nonatomic,strong)UIButton *button2;
@property (nonatomic,strong)UITextField *textField1;
@property (nonatomic,strong)UITextField *textField2;
@property (nonatomic,strong)UIImageView *imgView1;
@property (nonatomic,strong)UIImageView *imgView2;
- (instancetype)invokeInitAfterAgain;
- (instancetype)initAfter:(void (^)(ZLCollectionViewCell*  cell))block ;
- (instancetype)hookPrepareForReuse:(void (^)(ZLCollectionViewCell *cell))block ;
- (instancetype)hookLayoutSubviews:(void (^)(ZLCollectionViewCell *cell))block ;
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius frame:(CGRect)rect;
- (void)test;
@end


typedef void (^ZLSingleTapAction)(UIView *view);
@interface UIView (ZLListKit)
@property (nonatomic, copy) ZLSingleTapAction gm_singleTapAction;
@property (nonatomic,class,readonly)NSString *gm_reuseIdentifier;
@end


NS_ASSUME_NONNULL_END
