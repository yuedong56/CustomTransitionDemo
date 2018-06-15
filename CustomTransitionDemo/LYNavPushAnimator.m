//
//  LYNavPushAnimator.m
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/14.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "LYNavPushAnimator.h"


@implementation LYNavPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //转场过渡的容器view, 转场时看到的视图都是该view里的
    UIView *containerView = [transitionContext containerView];
    
    //FromVC（push时是FirstVC，pop时是SecondVC）
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [containerView addSubview:fromVC.view];

    //ToVC（push时是SecondVC，pop时是FirstVC）
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview:toVC.view];
    toVC.view.hidden = YES; //先隐藏，等结束后再显示

    //背景白色过渡
    UIView *bgView = [[UIView alloc] initWithFrame:toVC.view.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.alpha = 0;
    [containerView addSubview:bgView];
    
    //放大图
    UIImageView *largeImageView = [[UIImageView alloc] initWithFrame:self.beforeFrame];
    largeImageView.image = self.image;
    [containerView addSubview:largeImageView];
    
    //动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        largeImageView.frame = self.afterFrame;
        bgView.alpha = 1;
    }
    completion:^(BOOL finished) {
        
        //再显示SecondVC
        toVC.view.hidden = NO;
        
        //移除前面的 bgView、showImageView
        [bgView removeFromSuperview];
        [largeImageView removeFromSuperview];
        
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
//    //此处判断是push，还是pop （通过判断哪个 VC 在前面）
//    BOOL isPush = ([toVC.navigationController.viewControllers indexOfObject:toVC] >
//                   [fromVC.navigationController.viewControllers indexOfObject:fromVC]);
}

@end




