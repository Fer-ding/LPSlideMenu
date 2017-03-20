//
//  LPSlideMenuController.m
//  LPSlideMenu
//
//  Created by YueHui on 2017/3/17.
//  Copyright © 2017年 LeapDing. All rights reserved.
//

#import "LPSlideMenuController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface LPSlideMenuController ()

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *mainViewController;

@property (nonatomic, strong) UIButton *coverButton;

@end

@implementation LPSlideMenuController

#pragma mark - Public Method

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)initWithLeftVc:(UIViewController *)leftVc mainVc:(UIViewController *)mainVc{

    LPSlideMenuController *menuVc = [LPSlideMenuController sharedInstance];
    
    menuVc.leftViewController = leftVc;
    menuVc.mainViewController = mainVc;
    
    [menuVc.view addSubview:menuVc.leftViewController.view];
    [menuVc addChildViewController:menuVc.leftViewController];
    
    [menuVc.view addSubview:menuVc.mainViewController.view];
    [menuVc addChildViewController:menuVc.mainViewController];
    
    [menuVc configuration];
    
    return menuVc;
}

- (void)openDrawer {
    [self openDrawerWithDuration:self.autoScrollDurationTimeInterval];
}

- (void)closeDrawer {
    [self closeDrawerWithDuration:self.autoScrollDurationTimeInterval];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setCoverButton];
    
    self.leftViewController.view.transform = CGAffineTransformMakeTranslation(- kScreenWidth * 0.5, 0);
    
    if (self.mainViewController.childViewControllers.count > 1) {
        for (UIViewController *childViewController in self.mainViewController.childViewControllers) {
            [self addScreenEdgePanGestureRecognizerWithView:childViewController.view];
        }
    } else {
        [self addScreenEdgePanGestureRecognizerWithView:self.mainViewController.view];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (void)configuration {
    
    self.maxWidth = kScreenWidth * 0.8;
    self.autoScrollDurationTimeInterval = 0.2;
    [self.coverButton removeFromSuperview];
}

- (void)setCoverButton {
    
    if (!self.coverButton) {
        
        self.coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.coverButton.backgroundColor = [UIColor blackColor];
        self.coverButton.alpha = 0;
        self.coverButton.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        
        [self addPanGestureRecognizerWithView:self.coverButton];
        
    }
}

- (void)addScreenEdgePanGestureRecognizerWithView:(UIView *)view {
    UIScreenEdgePanGestureRecognizer *pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleScreenEdgePan:)];
    pan.edges = UIRectEdgeLeft;
    [view addGestureRecognizer:pan];
}

- (void)handleScreenEdgePan:(UIScreenEdgePanGestureRecognizer *)pan {
    
    CGFloat offsetX = [pan translationInView:pan.view].x;
    
    [UIView animateWithDuration:self.autoScrollDurationTimeInterval animations:^{
        if (pan.state == UIGestureRecognizerStateChanged && offsetX < self.maxWidth) {
            
            self.mainViewController.view.transform = CGAffineTransformMakeTranslation(offsetX, 0);
            self.leftViewController.view.transform = CGAffineTransformMakeTranslation(offsetX * kScreenWidth * 0.5 / self.maxWidth - kScreenWidth * 0.5, 0);
            
            [self.mainViewController.view addSubview:self.coverButton];
            self.coverButton.alpha = offsetX * 0.5 / self.maxWidth;
            
        } else if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateFailed) {
            
            if (offsetX > kScreenWidth * 0.5) {
                [self openDrawerWithDuration:(self.maxWidth - offsetX) / self.maxWidth * self.autoScrollDurationTimeInterval];
            } else {
                [self closeDrawerWithDuration:(self.maxWidth - offsetX) / self.maxWidth * self.autoScrollDurationTimeInterval];
            }
        }
    }];
}



- (void)openDrawerWithDuration:(NSTimeInterval)duration {
    
    [UIView animateWithDuration:duration animations:^{
        self.mainViewController.view.transform = CGAffineTransformMakeTranslation(self.maxWidth, 0);
        self.leftViewController.view.transform = CGAffineTransformIdentity;
        [self.mainViewController.view addSubview:self.coverButton];
        self.coverButton.alpha = 0.5;
    }];
}

- (void)closeDrawerWithDuration:(NSTimeInterval)duration {
    
    [UIView animateWithDuration:duration animations:^{
        self.mainViewController.view.transform = CGAffineTransformIdentity;
        self.leftViewController.view.transform = CGAffineTransformMakeTranslation(- kScreenWidth * 0.5, 0);
        self.coverButton.alpha = 0;
    } completion:^(BOOL finished) {
        [self.coverButton removeFromSuperview];
    }];
}

- (void)addPanGestureRecognizerWithView:(UIView *)view {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [view addGestureRecognizer:pan];
}

- (void)handlePan:(UIPanGestureRecognizer *)pan {
    
    CGFloat offsetX = [pan translationInView:pan.view].x;

    [UIView animateWithDuration:self.autoScrollDurationTimeInterval animations:^{
        if (pan.state == UIGestureRecognizerStateChanged) {
            
            if (offsetX < 0 && offsetX > -self.maxWidth) {
                
                self.mainViewController.view.transform = CGAffineTransformMakeTranslation(self.maxWidth + offsetX, 0);
                self.leftViewController.view.transform = CGAffineTransformMakeTranslation(offsetX * kScreenWidth * 0.5 / self.maxWidth, 0);
                
                self.coverButton.alpha = offsetX * 0.5 / self.maxWidth + 0.5;
                
            }
            
        } else if (pan.state == UIGestureRecognizerStateCancelled || pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateFailed) {
            
            if (offsetX < 0 && kScreenWidth - self.maxWidth + fabs(offsetX) > kScreenWidth * 0.5) {
                [self closeDrawerWithDuration:(self.maxWidth - offsetX) / self.maxWidth * self.autoScrollDurationTimeInterval];
            } else {
                [self openDrawerWithDuration:(self.maxWidth - offsetX) / self.maxWidth * self.autoScrollDurationTimeInterval];
            }
        }
    }];
    
}

#pragma mark - setters and getters

- (void)setIsSingleClickBack:(BOOL)isSingleClickBack {
    _isSingleClickBack = isSingleClickBack;
    
    if (isSingleClickBack) {
        [self.coverButton addTarget:self action:@selector(closeDrawer) forControlEvents:UIControlEventTouchUpInside];
    }
}

@end
