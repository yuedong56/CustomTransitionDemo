//
//  LYNavPopAnimator.h
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/14.
//  Copyright © 2018年 YR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYNavPopAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGRect beforeFrame;
@property (nonatomic, assign) CGRect afterFrame;
@property (nonatomic, strong) UIImage *image;


@end
