//
//  CYCustomAlertView.m
//  CYCustomAlertView
//
//  Created by CY on 16/6/8.
//  Copyright © 2016年 iTaa. All rights reserved.
//

#import "CYCustomAlertView.h"

#define STANDARD_WIDTH ([UIScreen mainScreen].bounds.size.width * 45 / 62)
#define STANDARD_CENTER_X ([UIScreen mainScreen].bounds.size.width / 2)
#define STANDARD_CENTER_Y ([UIScreen mainScreen].bounds.size.height / 2)

@interface CYCustomAlertView()
@property (nonatomic, strong) UIImageView *topImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) RoundButton *actionButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIView *maskView;
@end

@implementation CYCustomAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(instancetype)customAlertViewWithImage:(UIImage *)image
                                  title:(NSString *)title
                                message:(NSString *)message
                               delegate:(id <CYCustomAlertViewDelegate>)delegete
                     acctionButtonTitle:(NSString *)acctionButtonTitle{
    CYCustomAlertView *alertView = [[CYCustomAlertView alloc] init];
    alertView.topImage = image;
    alertView.title = title;
    alertView.message = message;
    alertView.delegate = delegete;
    alertView.actionButtonTitle = acctionButtonTitle;
    return alertView;
}

-(instancetype)initWithImage:(UIImage *)image
                       title:(NSString *)title
                     message:(NSString *)message
                    delegate:(id <CYCustomAlertViewDelegate>)delegete
          acctionButtonTitle:(NSString *)acctionButtonTitle{
    self = [super init];
    if (self) {
        self.topImage = image;
        self.title = title;
        self.message = message;
        self.delegate = delegete;
        self.actionButtonTitle = acctionButtonTitle;
    }
    return self;
}


-(UIImageView *)topImageView{
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width * 176 / 351);
        _topImageView.frame = frame;
        _topImageView.image = self.topImage;
    }
    return _topImageView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        CGRect frame = CGRectMake(0, 0, self.frame.size.width * 2.1 / 3, 40);
        CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 * 0.80);
        _titleLabel.frame = frame;
        _titleLabel.font = [UIFont systemFontOfSize:40];
        _titleLabel.center = center;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        _titleLabel.text = self.title;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}


-(UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        CGRect frame = CGRectMake(0, 0, self.frame.size.width * 2.3 / 3, 60);
        CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 * 1.25);
        _messageLabel.frame = frame;
        _messageLabel.center = center;
        _messageLabel.font = [UIFont systemFontOfSize:17];
        _messageLabel.text = self.message;
        _messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 3;
    }
    return _messageLabel;
}


-(RoundButton *)actionButton{
    if (!_actionButton) {
        _actionButton = [[RoundButton alloc] init];
        CGRect frame = CGRectMake(0, 0, self.frame.size.width * 2.5 / 3, 40);
        CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2 * 1.65);
        _actionButton.frame = frame;
        _actionButton.center = center;
        [_actionButton setTitle:self.actionButtonTitle forState:UIControlStateNormal];
        [_actionButton addTarget:self action:@selector(actionButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_actionButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _actionButton;
}

-(UIButton *)cancelButton{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        CGRect frame = CGRectMake(0, 0, self.frame.size.width * 20 / 175, self.frame.size.width * 20 / 175);
        CGPoint center = CGPointMake(self.frame.size.width - self.frame.size.width * 3 / 35, self.frame.size.width * 3 / 35);
        _cancelButton.frame = frame;
        _cancelButton.center = center;
        [_cancelButton setImage:[UIImage imageNamed:@"icon_cancel"] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

-(UIView *)maskView{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen ].bounds];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.5;
    }
    return _maskView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGRect frame = CGRectMake(0, 0, STANDARD_WIDTH, STANDARD_WIDTH);
        CGPoint center = CGPointMake(STANDARD_CENTER_X, STANDARD_CENTER_Y);
        self.frame = frame;
        self.center = center;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self addSubview:self.topImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.messageLabel];
    [self addSubview:self.actionButton];
    [self addSubview:self.cancelButton];
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskView]; // 添加蒙版
    [[UIApplication sharedApplication].keyWindow addSubview:self];  // 添加View
}

-(void)actionButtonClick{
    if ([self.delegate respondsToSelector:@selector(customAlertView:isCancel:)]) {
        [self.delegate customAlertView:self isCancel:NO];
    }
    [self dismiss];
}

-(void)cancelButtonClick{
    if ([self.delegate respondsToSelector:@selector(customAlertView:isCancel:)]) {
        [self.delegate customAlertView:self isCancel:YES];
    }
    [self dismiss];
}

-(void)dismiss{
    [self.maskView removeFromSuperview];// 移除蒙版
    [self removeFromSuperview]; // 移除自己
}
@end


@implementation RoundButton

-(void) setEnabled:(BOOL)newEnabled
{
    [super setEnabled:newEnabled];
    
    if(newEnabled) {
        self.layer.borderColor = [[UIColor blueColor] CGColor];
    } else {
        self.layer.borderColor = [[UIColor grayColor] CGColor];
    }
}

-(void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    self.layer.cornerRadius = 20.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 2.0f;
    
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    if(self.enabled) {
        self.layer.borderColor = [[UIColor blueColor] CGColor];
    } else {
        self.layer.borderColor = [[UIColor grayColor] CGColor];
    }
}

@end
