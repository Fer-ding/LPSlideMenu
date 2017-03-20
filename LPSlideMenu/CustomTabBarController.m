//
//  CustomTabBarController.m
//  LPSlideMenu
//
//  Created by YueHui on 2017/3/17.
//  Copyright © 2017年 LeapDing. All rights reserved.
//

#import "CustomTabBarController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[[ViewController1 alloc] init] title:@"消息" image:@"tab_recent_nor" selectedImage:@"tab_recent_press"];
    [self addChildViewController:[[ViewController2 alloc] init] title:@"联系人" image:@"tab_qworld_nor" selectedImage:@"tab_qworld_press"];
    [self addChildViewController:[[ViewController3 alloc] init] title:@"动态" image:@"tab_buddy_nor" selectedImage:@"tab_buddy_press"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:nav];
    
}

@end
