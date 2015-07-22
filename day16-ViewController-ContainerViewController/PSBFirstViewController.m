//
//  PSBFirstViewController.m
//  day16-ViewController-ContainerViewController
//
//  Created by 潘松彪 on 14-8-28.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import "PSBFirstViewController.h"
#import "UIView+PSBTransitionAnimation.h"
#import "PSBContainerViewController.h"

@interface PSBFirstViewController ()

@end

@implementation PSBFirstViewController

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(onClick2:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [button release];
}

- (void)onClick:(UIButton *)button
{
    //通过容器视图控制器，切换到second视图控制器
    UIViewController * svc = self.parentViewController.childViewControllers[1];
    
    //添加动画
    [self.view.superview setTransitionAnimationType:PSBTransitionAnimationTypePageUnCurl toward:PSBTransitionAnimationTowardFromTop duration:1];
    
    //切换
    [self.parentViewController transitionFromViewController:self toViewController:svc duration:0 options:0 animations:nil completion:nil];
}

- (void)onClick2:(UIButton *)button
{
    //通过容器视图控制器，切换到second视图控制器
    UIViewController * svc = self.parentViewController.childViewControllers[1];
    
    [(PSBContainerViewController *)self.parentViewController transitionHalfToViewController:svc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
