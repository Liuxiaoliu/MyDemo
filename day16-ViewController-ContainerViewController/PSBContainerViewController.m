//
//  PSBContainerViewController.m
//  day16-ViewController-ContainerViewController
//
//  Created by 潘松彪 on 14-8-28.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import "PSBContainerViewController.h"

@interface PSBContainerViewController ()

@end

@implementation PSBContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //将第一个子视图控制器的主视图显示出来
    [self.view addSubview:[self.childViewControllers[0] view]];
}

//切换到某个视图
- (void)transitionHalfToViewController:(UIViewController *)vc
{
    //将vc.view插入红色视图下方
    [self.view insertSubview:vc.view belowSubview:[self.childViewControllers[0] view]];
    //将红色视图通过动画向右拉一半
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    [self.childViewControllers[0] view].center = CGPointMake(320, 240);
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 关于视图控制器旋转的方向

//是否允许旋转  如果使用了容器 只能容器重写这个方法 子视图控制器，重写无效
- (BOOL)shouldAutorotate
{
    return YES;
}

//返回支持的方向
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

//视图控制器，即将转向某个方向，调用这个方法
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //发生旋转时，在这里调用重新布局的方法。
    //第一个参数是即将转向的方向
    switch (toInterfaceOrientation) {
        case UIInterfaceOrientationLandscapeLeft:
            NSLog(@"向左");
            break;
        case UIInterfaceOrientationLandscapeRight:
            NSLog(@"向右");
            break;
        case UIInterfaceOrientationPortrait:
            NSLog(@"正向");
            break;
            
        default:
            break;
    }
}

@end








