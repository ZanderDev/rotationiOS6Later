//
//  SecondViewController.m
//  rotationios6later
//
//  Created by zhangdong06 on 15/2/10.
//  Copyright (c) 2015年 zandereric. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+Rotation_IOS6Later.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

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


@end
