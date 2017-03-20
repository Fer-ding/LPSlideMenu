//
//  LPLeftViewController.m
//  LPSlideMenu
//
//  Created by YueHui on 2017/3/17.
//  Copyright © 2017年 LeapDing. All rights reserved.
//

#import "LPLeftViewController.h"
#import "LPSlideMenuController.h"
#import "SecondViewController.h"

@interface LPLeftViewController ()

@end

@implementation LPLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor cyanColor];
    UIImage *bgImage = [UIImage imageNamed:@"shouye"];
    self.view.layer.contents = (__bridge id)bgImage.CGImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[LPSlideMenuController sharedInstance] JumpByDrawerClosedCompletionBlock:^(UIViewController *mainViewController) {
        SecondViewController *secondVc = [[SecondViewController alloc] init];
        secondVc.hidesBottomBarWhenPushed = YES;
        [mainViewController.navigationController pushViewController:secondVc animated:NO];
    }];
}

@end
