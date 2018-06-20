//
//  SecondViewController.m
//  Present
//
//  Created by yuedongkui on 2018/6/19.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "SecondViewController.h"
#import "PopAnimator.h"
#import "InteractiveTransition.h"

@interface SecondViewController ()<UINavigationControllerDelegate>
{
    PopAnimator *popAnimator;
    InteractiveTransition *interactiveTranstion;
}


@end





@implementation SecondViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
}
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    popAnimator = [[PopAnimator alloc] init];
    interactiveTranstion = [[InteractiveTransition alloc] init];
    interactiveTranstion.vc = self;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:interactiveTranstion action:@selector(panGestureAction:)];
    [self.view addGestureRecognizer:pan];
    
    self.navigationController.delegate = self;

}

#pragma mark -
//Pop
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return popAnimator;
    }
    return nil;
}

//交互
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return interactiveTranstion;
}

@end
