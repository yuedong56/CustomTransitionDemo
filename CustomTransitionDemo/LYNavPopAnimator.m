//
//  LYNavPopAnimator.m
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/14.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "LYNavPopAnimator.h"

@implementation LYNavPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
//    self.beforeFrame = CGRectMake(20, 100, 100, 100);
//    self.afterFrame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    //转场过渡的容器view, 转场时看到的视图都是该view里的
    UIView *containerView = [transitionContext containerView];
    
    //ToVC（即FirstVC）
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:toVC.view];
    
    //替换原来的小图，不会大图小图同时出现
    UIView *smallImageView = [[UIImageView alloc] initWithFrame:self.beforeFrame];
    smallImageView.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:smallImageView];
    
    //白色背景
    UIView *bgView = [[UIView alloc] initWithFrame:toVC.view.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:bgView];
    bgView.alpha = 1;
    
    //大图
    UIImageView *largeImageView = [[UIImageView alloc] initWithFrame:self.afterFrame];
    largeImageView.image = self.image;
    [containerView addSubview:largeImageView];
    
    
    //动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        bgView.alpha = 0;
        largeImageView.frame = self.beforeFrame;
    }
    completion:^(BOOL finished) {
        
        //移除前面的 smallImageView、bgView、largeImageView
        [smallImageView removeFromSuperview];
        [bgView removeFromSuperview];
        [largeImageView removeFromSuperview];

        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
    }];
}

@end
