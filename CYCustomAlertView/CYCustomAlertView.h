//
//  CYCustomAlertView.h
//  CYCustomAlertView
//
//  Created by iTaa on 16/6/8.
//  Copyright © 2016年 ChinaPnR. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CYCustomAlertViewDelegate;
@interface CYCustomAlertView : UIView
@property (nonatomic, strong) UIImage *topImage;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *actionButtonTitle;
@property (nonatomic, weak) id <CYCustomAlertViewDelegate>delegate;

+(instancetype)customAlertViewWithImage:(UIImage *)image
                                  title:(NSString *)title
                                message:(NSString *)message
                               delegate:(id <CYCustomAlertViewDelegate>)delegete
                     acctionButtonTitle:(NSString *)acctionButtonTitle;
-(instancetype)initWithImage:(UIImage *)image
                                  title:(NSString *)title
                                message:(NSString *)message
                               delegate:(id <CYCustomAlertViewDelegate>)delegete
                     acctionButtonTitle:(NSString *)acctionButtonTitle;
-(void)show;

@end


@protocol CYCustomAlertViewDelegate <NSObject>

@optional
-(void)customAlertView:(CYCustomAlertView *)alertView isCancel:(BOOL)isCancel;
@end

@interface RoundButton : UIButton

@end