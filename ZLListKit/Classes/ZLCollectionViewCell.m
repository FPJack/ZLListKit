//
//  ZLCollectionViewCell.m
//  ZLListKit
//
//  Created by 卿之 on 2024/4/30.
//

#import "ZLCollectionViewCell.h"
#import <objc/runtime.h>

@interface ZLView()
@property (nonatomic,strong)CAShapeLayer *maskLayer;
@property (nonatomic,assign)BOOL invokeThenCallBack;
@property (nonatomic,copy)void (^layoutSubviewsBlock)(ZLView *view);
@property (nonatomic,copy)void (^initAfterBlock)(ZLView *view);
@end
@implementation ZLView
- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [[UIStackView alloc] init];
        [self addSubview:_stackView];
    }
    return _stackView;
}
- (UIView *)view1 {
    if (!_view1) {
        _view1 = UIView.new;
        [self addSubview:_view1];
    }
    return _view1;
}
- (UIView *)view2 {
    if (!_view2) {
        _view2 = UIView.new;
        [self addSubview:_view2];
    }
    return _view2;
}
- (UIView *)view3 {
    if (!_view3) {
        _view3 = UIView.new;
        [self addSubview:_view3];
    }
    return _view3;
}
- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        [self addSubview:_label1];
    }
    return _label1;
}
- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        [self addSubview:_label2];
    }
    return _label2;
}
- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        [self addSubview:_label3];
    }
    return _label3;
}
- (UIImageView *)imgView1 {
    if (!_imgView1) {
        _imgView1 = [[UIImageView alloc] init];
        [self addSubview:_imgView1];
    }
    return _imgView1;
}
- (UIImageView *)imgView2 {
    if (!_imgView2) {
        _imgView2 = [[UIImageView alloc] init];
        [self addSubview:_imgView2];
    }
    return _imgView2;
}
- (UITextField *)textField1 {
    if (!_textField1) {
        _textField1 = [[UITextField alloc] init];
        [self addSubview:_textField1];
    }
    return _textField1;
}
- (UITextField *)textField2 {
    if (!_textField2) {
        _textField2 = [[UITextField alloc] init];
        [self addSubview:_textField2];
    }
    return _textField2;
}
- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button1];
    }
    return _button1;
}
- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button2];
    }
    return _button2;
}
- (instancetype)invokeInitAfterAgain {
    if (self.initAfterBlock) {
        self.initAfterBlock(self);
    }
    return self;
}
- (instancetype)initAfter:(void (^)(ZLView*  view))block {
    if (self.invokeThenCallBack) return self;
    if (block) {
        self.invokeThenCallBack = YES;
        block(self);
    }
    self.initAfterBlock = block;
    return self;
}

- (instancetype)hookLayoutSubviews:(void (^)(ZLView *view))block {
    self.layoutSubviewsBlock = block;
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.layoutSubviewsBlock) {
        self.layoutSubviewsBlock(self);
    }
}
- (CAShapeLayer *)maskLayer {
    if (!_maskLayer) {
        _maskLayer = CAShapeLayer.layer;
    }
    return _maskLayer;
}
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius {
    if (radius <= 0) {
        self.layer.mask = nil;
    }else {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, radius)];
        self.maskLayer.frame = self.bounds;
        self.maskLayer.path = maskPath.CGPath;
        self.layer.mask = self.maskLayer;
    }
   
}
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius frame:(CGRect)rect{
    if (radius <= 0) {
        self.layer.mask = nil;
    }else {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                  
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, radius)];
        self.maskLayer.frame = self.bounds;
        self.maskLayer.path = maskPath.CGPath;
        self.layer.mask = self.maskLayer;
    }
}
- (void)test {}

@end




@interface ZLCollectionReusableView()
@property (nonatomic,strong)CAShapeLayer *maskLayer;
@property (nonatomic,assign)BOOL invokeThenCallBack;
@property (nonatomic,copy)void (^prepareForReuseBlock)(ZLCollectionReusableView *view);
@property (nonatomic,copy)void (^layoutSubviewsBlock)(ZLCollectionReusableView *view);
@property (nonatomic,copy)void (^initAfterBlock)(ZLCollectionReusableView *view);

@end
@implementation ZLCollectionReusableView
- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [[UIStackView alloc] init];
        [self addSubview:_stackView];
    }
    return _stackView;
}
- (UIView *)view1 {
    if (!_view1) {
        _view1 = UIView.new;
        [self addSubview:_view1];
    }
    return _view1;
}
- (UIView *)view2 {
    if (!_view2) {
        _view2 = UIView.new;
        [self addSubview:_view2];
    }
    return _view2;
}
- (UIView *)view3 {
    if (!_view3) {
        _view3 = UIView.new;
        [self addSubview:_view3];
    }
    return _view3;
}
- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        [self addSubview:_label1];
    }
    return _label1;
}
- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        [self addSubview:_label2];
    }
    return _label2;
}
- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        [self addSubview:_label3];
    }
    return _label3;
}
- (UIImageView *)imgView1 {
    if (!_imgView1) {
        _imgView1 = [[UIImageView alloc] init];
        [self addSubview:_imgView1];
    }
    return _imgView1;
}
- (UIImageView *)imgView2 {
    if (!_imgView2) {
        _imgView2 = [[UIImageView alloc] init];
        [self addSubview:_imgView2];
    }
    return _imgView2;
}
- (UITextField *)textField1 {
    if (!_textField1) {
        _textField1 = [[UITextField alloc] init];
        [self addSubview:_textField1];
    }
    return _textField1;
}
- (UITextField *)textField2 {
    if (!_textField2) {
        _textField2 = [[UITextField alloc] init];
        [self addSubview:_textField2];
    }
    return _textField2;
}
- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button1];
    }
    return _button1;
}
- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button2];
    }
    return _button2;
}
- (instancetype)invokeInitAfterAgain {
    if (self.initAfterBlock) self.initAfterBlock(self);
    return self;
}
- (instancetype)initAfter:(void (^)(ZLCollectionReusableView*  view))block {
    if (self.invokeThenCallBack) return self;
    if (block) {
        self.invokeThenCallBack = YES;
        block(self);
    }
    self.initAfterBlock = block;
    return self;
}
- (instancetype)hookPrepareForReuse:(void (^)(ZLCollectionReusableView *view))block {
    self.prepareForReuseBlock = block;
    return self;
}
- (instancetype)hookLayoutSubviews:(void (^)(ZLCollectionReusableView *view))block {
    self.layoutSubviewsBlock = block;
    return self;
}
- (void)prepareForReuse {
    [super prepareForReuse];
    if (self.prepareForReuseBlock) {
        self.prepareForReuseBlock(self);
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.layoutSubviewsBlock) {
        self.layoutSubviewsBlock(self);
    }
}
- (CAShapeLayer *)maskLayer {
    if (!_maskLayer) {
        _maskLayer = CAShapeLayer.layer;
    }
    return _maskLayer;
}
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius {
    if (radius <= 0) {
        self.layer.mask = nil;
    }else {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, radius)];
        self.maskLayer.frame = self.bounds;
        self.maskLayer.path = maskPath.CGPath;
        self.layer.mask = self.maskLayer;
    }
   
}
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius frame:(CGRect)rect{
    if (radius <= 0) {
        self.layer.mask = nil;
    }else {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                  
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, radius)];
        self.maskLayer.frame = self.bounds;
        self.maskLayer.path = maskPath.CGPath;
        self.layer.mask = self.maskLayer;
    }
}
- (void)test {}

@end




@interface ZLCollectionViewCell()
@property (nonatomic,strong)CAShapeLayer *maskLayer;
@property (nonatomic,assign)BOOL invokeThenCallBack;
@property (nonatomic,copy)void (^prepareForReuseBlock)(ZLCollectionViewCell *cell);
@property (nonatomic,copy)void (^layoutSubviewsBlock)(ZLCollectionViewCell *cell);
@property (nonatomic,copy)void (^initAfterBlock)(ZLCollectionViewCell *view);

@end
@implementation ZLCollectionViewCell
- (UIStackView *)stackView {
    if (!_stackView) {
        _stackView = [[UIStackView alloc] init];
        [self.contentView addSubview:_stackView];
    }
    return _stackView;
}
- (UIView *)view1 {
    if (!_view1) {
        _view1 = UIView.new;
        [self.contentView addSubview:_view1];
    }
    return _view1;
}
- (UIView *)view2 {
    if (!_view2) {
        _view2 = UIView.new;
        [self.contentView addSubview:_view2];
    }
    return _view2;
}
- (UIView *)view3 {
    if (!_view3) {
        _view3 = UIView.new;
        [self.contentView addSubview:_view3];
    }
    return _view3;
}
- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
    }
    return _label1;
}
- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        [self.contentView addSubview:_label2];
    }
    return _label2;
}
- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        [self.contentView addSubview:_label3];
    }
    return _label3;
}
- (UIImageView *)imgView1 {
    if (!_imgView1) {
        _imgView1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgView1];
    }
    return _imgView1;
}
- (UIImageView *)imgView2 {
    if (!_imgView2) {
        _imgView2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgView2];
    }
    return _imgView2;
}
- (UITextField *)textField1 {
    if (!_textField1) {
        _textField1 = [[UITextField alloc] init];
        [self.contentView addSubview:_textField1];
    }
    return _textField1;
}
- (UITextField *)textField2 {
    if (!_textField2) {
        _textField2 = [[UITextField alloc] init];
        [self.contentView addSubview:_textField2];
    }
    return _textField2;
}
- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_button1];
    }
    return _button1;
}
- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_button2];
    }
    return _button2;
}
- (instancetype)invokeInitAfterAgain {
    if (self.initAfterBlock) self.initAfterBlock(self);
    return self;
}
- (instancetype)initAfter:(void (^)(ZLCollectionViewCell*  cell))block {
    if (self.invokeThenCallBack) return self;
    if (block) {
        self.invokeThenCallBack = YES;
        block(self);
    }
    self.initAfterBlock = block;
    return self;
}
- (instancetype)hookPrepareForReuse:(void (^)(ZLCollectionViewCell *cell))block {
    self.prepareForReuseBlock = block;
    return self;
}
- (instancetype)hookLayoutSubviews:(void (^)(ZLCollectionViewCell *cell))block {
    self.layoutSubviewsBlock = block;
    return self;
}
- (void)prepareForReuse {
    [super prepareForReuse];
    if (self.prepareForReuseBlock) {
        self.prepareForReuseBlock(self);
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.layoutSubviewsBlock) {
        self.layoutSubviewsBlock(self);
    }
}
- (CAShapeLayer *)maskLayer {
    if (!_maskLayer) {
        _maskLayer = CAShapeLayer.layer;
    }
    return _maskLayer;
}
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius {
    if (radius <= 0) {
        self.layer.mask = nil;
    }else {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, radius)];
        self.maskLayer.frame = self.bounds;
        self.maskLayer.path = maskPath.CGPath;
        self.layer.mask = self.maskLayer;
    }
   
}
- (void)roundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius frame:(CGRect)rect{
    if (radius <= 0) {
        self.layer.mask = nil;
    }else {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                  
                                                       byRoundingCorners:corners
                                                             cornerRadii:CGSizeMake(radius, radius)];
        self.maskLayer.frame = self.bounds;
        self.maskLayer.path = maskPath.CGPath;
        self.layer.mask = self.maskLayer;
    }
}
- (void)test {}
@end







@interface UIView()
@property (nonatomic, copy) UITapGestureRecognizer *gm_singleTapGesture;
@end
@implementation UIView (ZLListKit)
static const char *tapActionKey = "TapActionKey";
static const char *singleTapGestureKey = "singleTapGestureKey";
- (void)setGm_singleTapGesture:(UITapGestureRecognizer *)gm_singleTapGesture {
    objc_setAssociatedObject(self, singleTapGestureKey, gm_singleTapGesture, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UITapGestureRecognizer *)gm_singleTapGesture {
    UITapGestureRecognizer *tapGesture = objc_getAssociatedObject(self, singleTapGestureKey);
    if (!tapGesture) {
        tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gm_singleTapSel)];
        self.gm_singleTapGesture = tapGesture;
    }
    return tapGesture;
}

- (void)setGm_singleTapAction:(ZLSingleTapAction)gm_singleTapAction {
    if (gm_singleTapAction) {
        objc_setAssociatedObject(self, tapActionKey, gm_singleTapAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
        if ([self isKindOfClass:UIImageView.class]) self.userInteractionEnabled = YES;
        [self addGestureRecognizer:self.gm_singleTapGesture];
    }else {
        [self removeGestureRecognizer:self.gm_singleTapGesture];
    }
}
- (ZLSingleTapAction)gm_singleTapAction {
    return objc_getAssociatedObject(self, tapActionKey);
}
- (void)gm_singleTapSel {
    ZLSingleTapAction action = objc_getAssociatedObject(self, tapActionKey);
    if (action) action(self);
    
}
+ (NSString *)gm_reuseIdentifier {
    return NSStringFromClass(self);
}
@end

