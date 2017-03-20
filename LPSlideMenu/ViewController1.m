//
//  ViewController1.m
//  LPSlideMenu
//
//  Created by YueHui on 2017/3/17.
//  Copyright © 2017年 LeapDing. All rights reserved.
//

#import "ViewController1.h"
#import "LPSlideMenuController.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"消息";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"run10"] style:UIBarButtonItemStylePlain target:self action:@selector(openDrawer)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response

- (void)openDrawer {
    [[LPSlideMenuController sharedInstance] openDrawer];
}

@end
