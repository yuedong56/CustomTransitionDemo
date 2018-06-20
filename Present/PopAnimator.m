//
//  PopAnimator.m
//  Present
//
//  Created by yuedongkui on 2018/6/19.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "PopAnimator.h"

@implementation PopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *srcVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *secondVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:srcVC.view];
    
    [containerView addSubview:secondVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        secondVC.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, secondVC.view.bounds.size.width, secondVC.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
