//
//  UIViewController+Rotation_IOS6Later.h
//  zander
//
//  Created by zander on 15/2/10.
//  Copyright (c) 2015年 zander. All rights reserved.
//

/*
 ********* 解决ios6及其以上的转屏问题
 
 使用方法：
 
 1、在将要设置转屏规则的viewController，展示时设置window的rootViewController 的 isShouldAutorotate 、 supportedOrientations 、 preferredOrientation 三个属性即可控制当前viewController屏幕转屏设置。

 2、在该viewController不显示的时候调用reset 方法，初始化转屏设置。
 
 
*/


 /*
  ******* sample *******
 
     - (void)viewDidAppear:(BOOL)animated
     {
        [super viewDidAppear:animated];
        [[UIWindow rooVC] setIsShouldAutorotate:YES supportedOrientations:UIInterfaceOrientationMaskAll preferredOrientation:UIInterfaceOrientationPortrait];
     
     }
     
     - (void)viewDidDisappear:(BOOL)animated
     {
        [super viewDidDisappear:animated];
        [[UIWindow rooVC] reset];
     }

 ******* sample *******
 */



#import <UIKit/UIKit.h>

@interface UIViewController (Rotation_IOS6Later)

@property (nonatomic, assign) BOOL isShouldAutorotate;
@property (nonatomic, assign) UIInterfaceOrientationMask supportedOrientations;
@property (nonatomic, assign) UIInterfaceOrientation preferredOrientation;



// ** 便捷使用的方法

///初始化成默认的状态 不支持转屏、默认竖屏显示
-(void)reset;
///设置
-(void)setIsShouldAutorotate:(BOOL)isShouldAutorotate
       supportedOrientations:(UIInterfaceOrientationMask)supportedOrientations
        preferredOrientation:(UIInterfaceOrientation)preferredOrientation;


// 是否支持屏幕旋转
- (BOOL)shouldAutorotate;
// 支持的旋转方向
- (NSUInteger)supportedInterfaceOrientations ;
// 一开始的屏幕旋转方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation ;


@end








@interface UIWindow (rootVC)
///返回项目中keyWindow的rootViewController
+(UIViewController*)rooVC;
@end






