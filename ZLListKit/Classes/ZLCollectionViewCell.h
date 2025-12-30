//
//  ZLCollectionViewCell.h
//  GMListKit
//
//  Created by 卿之 on 2024/4/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GMView : UIView
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
- (instancetype)initAfter:(void (^)(GMView*  view))block;

/// 再次调用initAfter，场景cell复用的时候可刷新资源布局
- (instancetype)invokeInitAfterAgain;

/// 调用layoutSubviews的时候调用
/// - Parameter block: <#block description#>
- (instancetype)hookLayoutSubviews:(void (^)(GMView *view))block ;

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


@interface GMCollectionReusableView : UICollectionReusableView
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
- (instancetype)initAfter:(void (^)(GMCollectionReusableView*  view))block ;
/// cell复用的使用调用
/// - Parameter block: <#block description#>
- (instancetype)hookPrepareForReuse:(void (^)(GMCollectionReusableView *view))block;

/// cell布局的时候调用
/// - Parameter block: <#block description#>
- (instancetype)hookLayoutSubviews:(void (^)(GMCollectionReusableView *view))block;
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


typedef void (^GMSingleTapAction)(UIView *view);
@interface UIView (GMListKit)
@property (nonatomic, copy) GMSingleTapAction gm_singleTapAction;
@property (nonatomic,class,readonly)NSString *gm_reuseIdentifier;
@end


NS_ASSUME_NONNULL_END
