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

- (void)openDrawer;
- (void)closeDrawer;

@property (nonatomic, assign) CGFloat maxWidth;
@property (assign, nonatomic) NSTimeInterval autoScrollDurationTimeInterval;
@property (nonatomic, assign) BOOL isSingleClickBack;

@end
