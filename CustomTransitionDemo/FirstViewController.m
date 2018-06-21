//
//  FirstViewController.m
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/14.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

#import "LYNavPushAnimator.h"
#import "LYNavPopAnimator.h"
#import "LYNavInteractiveAnimator.h"

@interface FirstViewController () <UINavigationControllerDelegate>

@property (nonatomic, strong) LYNavPushAnimator *navPushAnimator;
@property (nonatomic, strong) LYNavInteractiveAnimator *navInteractiveAnimator;

@end



@implementation FirstViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navPushAnimator = [[LYNavPushAnimator alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
    imageView1.image = [UIImage imageNamed:@"1.jpg"];
    imageView1.userInteractionEnabled = YES;
    [self.view addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 100, 100, 100)];
    imageView2.image = [UIImage imageNamed:@"2.jpg"];
    imageView2.userInteractionEnabled = YES;
    [self.view addSubview:imageView2];
    
    //点击放大手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [imageView1 addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [imageView2 addGestureRecognizer:tap2];
}

#pragma mark -
- (void)tapAction:(UITapGestureRecognizer *)gesture
{
    UIImageView *imageView = (UIImageView *)gesture.view;
    UIImage *image = imageView.image;
    
    self.navigationController.delegate = self; //设置代理

    SecondViewController *vc = [[SecondViewController alloc] initWithImage:image beforeFrame:imageView.frame];
    [self.navigationController pushViewController:vc animated:YES];
    
    self.navPushAnimator.beforeFrame = imageView.frame;
    self.navPushAnimator.afterFrame = [vc imageViewFrameWithImage:image];
    self.navPushAnimator.image = image;
}

#pragma mark - UINavigationControllerDelegate
// push 和 pop 转场动画代理
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.navPushAnimator;
    }
    return nil;
}

@end








