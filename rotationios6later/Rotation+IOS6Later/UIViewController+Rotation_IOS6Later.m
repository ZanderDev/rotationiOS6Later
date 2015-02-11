//
//  UIViewController+Rotation_IOS6Later.h
//  zander
//
//  Created by zander on 15/2/10.
//  Copyright (c) 2015年 zander. All rights reserved.
//


#import "UIViewController+Rotation_IOS6Later.h"
#import <objc/runtime.h>

static const void *isShouldAutorotateKey = &isShouldAutorotateKey;
static const void *supportedOrientationsKey = &supportedOrientationsKey;
static const void *preferredOrientationKey = &preferredOrientationKey;


@implementation UIViewController (Rotation_IOS6Later)

@dynamic isShouldAutorotate;
@dynamic supportedOrientations;
@dynamic preferredOrientation;


#pragma mark - tool methods

///初始化成默认的状态 不支持转屏、默认竖屏显示
-(void)reset{
    [self setIsShouldAutorotate:NO supportedOrientations:UIInterfaceOrientationMaskPortrait preferredOrientation:UIInterfaceOrientationPortrait];
}
///设置
-(void)setIsShouldAutorotate:(BOOL)isShouldAutorotate
       supportedOrientations:(UIInterfaceOrientationMask)supportedOrientations
        preferredOrientation:(UIInterfaceOrientation)preferredOrientation{
    self.isShouldAutorotate = isShouldAutorotate;
    self.supportedOrientations = supportedOrientations;
    self.preferredOrientation = preferredOrientation;
}


#pragma mark 属性添加

-(BOOL)isShouldAutorotate{
    NSNumber *obj = objc_getAssociatedObject(self, isShouldAutorotateKey);
    if (nil == obj) {
        [self setIsShouldAutorotate:[obj boolValue]];
    }
    assert(obj);
    return YES;
    
}
-(void)setIsShouldAutorotate:(BOOL)isShouldAutorotate{
    objc_setAssociatedObject(self, isShouldAutorotateKey, [NSNumber numberWithBool:isShouldAutorotate], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



-(UIInterfaceOrientationMask)supportedOrientations{
    NSNumber *obj = objc_getAssociatedObject(self, supportedOrientationsKey);
    if (nil == obj) {
        [self setSupportedOrientations:[obj unsignedIntegerValue]];
        assert(obj);
    }
    return YES;
    
}
-(void)setSupportedOrientations:(UIInterfaceOrientationMask)supportedOrientations{
    objc_setAssociatedObject(self, supportedOrientationsKey, [NSNumber numberWithUnsignedInteger:supportedOrientations], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}




-(UIInterfaceOrientation)preferredOrientation{
    NSNumber *obj = objc_getAssociatedObject(self, preferredOrientationKey);
    if (nil == obj) {
        [self setPreferredOrientation:[obj integerValue]];
        assert(obj);
    }
    return YES;
    
}
-(void)setPreferredOrientation:(UIInterfaceOrientation)preferredOrientation{
    objc_setAssociatedObject(self, preferredOrientationKey, [NSNumber numberWithInteger:preferredOrientation], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



#pragma mark 转屏 - ios6 - 8

// 是否支持屏幕旋转 - 默认不支持旋转
- (BOOL)shouldAutorotate {
    BOOL isShould = NO;
    NSNumber * obj = objc_getAssociatedObject(self, isShouldAutorotateKey);
    if (obj) {
        isShould = [obj boolValue];
    }
    NSLog(@"%@ - 转屏吗？%d",NSStringFromSelector(_cmd),isShould);
    return isShould;
}

// 支持的旋转方向 - 默认只支持竖屏
- (NSUInteger)supportedInterfaceOrientations {
    NSUInteger supportedOrientations = UIInterfaceOrientationMaskPortrait;
    NSNumber * obj = objc_getAssociatedObject(self, supportedOrientationsKey);
    if (obj) {
        supportedOrientations = [obj unsignedIntegerValue];
    }
    NSLog(@"%@ - 支持的旋转方向 %ld",NSStringFromSelector(_cmd),supportedOrientations);
    return supportedOrientations;
}


// 一开始的屏幕旋转方向- 默认竖屏显示
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    NSInteger preferredOrientation = UIInterfaceOrientationPortrait;
    NSNumber * obj = objc_getAssociatedObject(self, preferredOrientationKey);
    if (obj) {
        preferredOrientation = [obj integerValue];
    }
    
    NSLog(@"%@ - 默认显示的方向 %ld \n\n\n",NSStringFromSelector(_cmd),(long)preferredOrientation);
    return preferredOrientation;
}


@end


@implementation UIWindow (rootVC)
+(UIViewController*)rooVC{
    UIViewController *rootViewController = (UIViewController*)[[[UIApplication sharedApplication]keyWindow] rootViewController];
    return rootViewController;
}
@end
