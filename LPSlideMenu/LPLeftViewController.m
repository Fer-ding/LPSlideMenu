//
//  LPLeftViewController.m
//  LPSlideMenu
//
//  Created by YueHui on 2017/3/17.
//  Copyright © 2017年 LeapDing. All rights reserved.
//

#import "LPLeftViewController.h"

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end