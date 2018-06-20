//
//  InteractiveTransition.h
//  Present
//
//  Created by yuedongkui on 2018/6/19.
//  Copyright © 2018年 YR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, weak) UIViewController *vc;

- (void)panGestureAction:(UIPanGestureRecognizer *)gesture;

@end
