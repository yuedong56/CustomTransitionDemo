//
//  LYNavInteractiveTransition.h
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/15.
//  Copyright © 2018年 YR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYNavInteractiveAnimator : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) CGRect beforeFrame;
@property (nonatomic, assign) CGRect afterFrame;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, weak) UIViewController *vc;

@property (nonatomic, assign) BOOL isPanning; //是否正在拖动



- (void)panGesutreAction:(UIPanGestureRecognizer *)gesture;


@end
