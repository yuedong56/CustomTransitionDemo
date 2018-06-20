//
//  LYNavInteractiveTransition.m
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/15.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "LYNavInteractiveAnimator.h"


@interface LYNavInteractiveAnimator ()

@property (nonatomic, strong) id<UIViewControllerContextTransitioning>transitionContext;

@end




@implementation LYNavInteractiveAnimator

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark -
//- (void)panGesutreAction:(UIPanGestureRecognizer *)gesture
//{
//    CGFloat scrale = [self percentForGesture:gesture];
//    NSLog(@"---interactive %f",scrale);
//
//    switch (gesture.state)
//    {
//        case UIGestureRecognizerStateBegan: {
//            [self.vc.navigationController popViewControllerAnimated:YES];
//        } break;
//        case UIGestureRecognizerStateChanged: {
////            [self updateInteractiveTransition:[self percentForGesture:gesture]];
//            [self updateInteractiveTransition:scrale];
//
//        } break;
//        case UIGestureRecognizerStateEnded: {
//            if (scrale > 0.95f){
//                [self cancelInteractiveTransition];
//            } else{
//                [self finishInteractiveTransition];
//            }
//        } break;
//        default: {
//            [self cancelInteractiveTransition];
//        } break;
//    }
//}
//
- (void)panGesutreAction:(UIPanGestureRecognizer *)recognizer
{
    CGFloat progress = [recognizer translationInView:self.vc.view].y / (self.vc.view.bounds.size.height * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    self.isPanning = YES;

    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self.vc.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded ||
             recognizer.state == UIGestureRecognizerStateCancelled) {
        if (progress > 0.1) {
            [self finishInteractiveTransition];
        }
        else {
            [self cancelInteractiveTransition];
        }
        self.isPanning = NO;
    }
}


- (CGFloat)percentForGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint translation = [gesture translationInView:gesture.view];
    
    CGFloat scale = 1 - fabs(translation.x / kScreenWidth);
    scale = scale < 0 ? 0 : scale;
    return scale;
}


@end
