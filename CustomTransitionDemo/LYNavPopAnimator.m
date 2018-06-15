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
    return 0.5;
}

//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
//{
//    self.beforeFrame = CGRectMake(20, 100, 100, 100);
//    self.afterFrame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
//    
//    //转场过渡的容器view, 转场时看到的视图都是该view里的
//    UIView *containerView = [transitionContext containerView];
//    
//    //FromVC（push时是FirstVC，pop时是SecondVC）
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    //ToVC（push时是SecondVC，pop时是FirstVC）
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    
//    //此处判断是push，还是pop （通过判断哪个 VC 在前面）
//    UIImageView *imageView;
//    BOOL isPush = ([toVC.navigationController.viewControllers indexOfObject:toVC] >
//                   [fromVC.navigationController.viewControllers indexOfObject:fromVC]);
//    if (isPush) {
//        [containerView addSubview:fromVC.view];
//        
//        imageView = [[UIImageView alloc] initWithFrame:self.smallImageFrame];
//        imageView.image = [UIImage imageNamed:@"123.jpg"];
//        [containerView addSubview:imageView];
//        
//        
//        //        [containerView addSubview:toVC.view];
//        toVC.view.frame = self.smallImageFrame;
//        //        toVC.view.hidden = YES;//先隐藏，等结束后再显示
//    } else {
//        [containerView addSubview:toVC.view];
//        [containerView addSubview:fromVC.view];
//        fromVC.view.frame = self.bigImageFrame;
//    }
//    //动画
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        if (isPush) {
//            imageView.frame = self.bigImageFrame;
//            //            toVC.view.frame = self.bigImageFrame;
//            
//        } else {
//            fromVC.view.frame = self.smallImageFrame;
//        }
//    } completion:^(BOOL finished) {
//        if (isPush) {
//            //            toVC.view.hidden = NO;
//        } else {
//            
//        }
//        BOOL wasCancelled = [transitionContext transitionWasCancelled];
//        //设置transitionContext通知系统动画执行完毕
//        [transitionContext completeTransition:!wasCancelled];
//    }];
//}

@end
