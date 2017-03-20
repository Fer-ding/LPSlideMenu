//
//  CustomTabBarController.m
//  LPSlideMenu
//
//  Created by YueHui on 2017/3/17.
//  Copyright © 2017年 LeapDing. All rights reserved.
//

#import "CustomTabBarController.h"
#import "MessageViewController.h"
#import "LinkmanViewController.h"
#import "DynamicViewController.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[[MessageViewController alloc] init] title:@"消息" image:@"tab_recent_nor" selectedImage:@"tab_recent_press"];
    [self addChildViewController:[[LinkmanViewController alloc] init] title:@"联系人" image:@"tab_qworld_nor" selectedImage:@"tab_qworld_press"];
    [self addChildViewController:[[DynamicViewController alloc] init] title:@"动态" image:@"tab_buddy_nor" selectedImage:@"tab_buddy_press"];
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
