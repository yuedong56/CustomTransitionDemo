//
//  InteractiveTransition.m
//  Present
//
//  Created by yuedongkui on 2018/6/19.
//  Copyright © 2018年 YR. All rights reserved.
//

#define kScreenWidth  (UIScreen.mainScreen.bounds.size.width)
#define kScreenHeight (UIScreen.mainScreen.bounds.size.height)


#import "InteractiveTransition.h"

@implementation InteractiveTransition

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)panGestureAction:(UIPanGestureRecognizer *)gesture
{
//    CGPoint translation = [gesture translationInView:gesture.view];
//    CGFloat scale = 1 - (translation.y / kScreenHeight);
//    scale = scale < 0 ? 0 : scale;
//    scale = scale > 1 ? 1 : scale;
//
    
    CGFloat scale = [gesture translationInView:self.vc.view].y / (self.vc.view.bounds.size.height * 1.0);
    scale = MIN(1.0, MAX(0.0, scale));

    NSLog(@"scale === %f", scale);
    
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self.vc.navigationController popViewControllerAnimated:YES];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self updateInteractiveTransition:scale];
    }
    else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        if (scale > 0.5) {
            [self finishInteractiveTransition];
        }
        else {
            [self cancelInteractiveTransition];
        }
    }
}

@end
