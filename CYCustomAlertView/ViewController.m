//
//  ViewController.m
//  CPCustomAlertView
//
//  Created by CY on 16/6/8.
//  Copyright © 2016年 iTaa. All rights reserved.
//

#import "ViewController.h"
#import "CYCustomAlertView.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)againClick:(id)sender {
    CYCustomAlertView *cycView = [[CYCustomAlertView alloc] init];
    cycView.topImage = [UIImage imageNamed:@"icon_alert"];
    cycView.title = @"XXXX失败";
    cycView.message = @"这里写上具体的失败内容，提示信息";
    cycView.actionButtonTitle = @"OK";
    [cycView show];
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
