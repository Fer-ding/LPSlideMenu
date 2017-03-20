//
//  LPSlideMenuController.h
//  LPSlideMenu
//
//  Created by YueHui on 2017/3/17.
//  Copyright © 2017年 LeapDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPSlideMenuController : UIViewController

+ (instancetype)sharedInstance;

- (instancetype)initWithLeftVc:(UIViewController *)leftVc mainVc:(UIViewController *)mainVc;

/// 选择左侧菜单进行跳转
///
/// - parameter viewController: 跳转目标控制器
- (void)JumpByDrawerClosedCompletionBlock:(void (^)(UIViewController *mainViewController))drawerClosedCompletionBlock;

- (void)openDrawer;
- (void)closeDrawer;

@property (nonatomic, assign) CGFloat maxWidth;
@property (assign, nonatomic) NSTimeInterval autoScrollDurationTimeInterval;
@property (nonatomic, assign) BOOL isSingleClickBack;

@end
