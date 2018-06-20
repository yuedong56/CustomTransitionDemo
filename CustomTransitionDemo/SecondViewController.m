//
//  SecondViewController.m
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/14.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "SecondViewController.h"
#import "LYNavPopAnimator.h"
#import "LYNavInteractiveAnimator.h"


@interface SecondViewController () <UINavigationControllerDelegate>
{
    CGRect _beforeFrame;
}
@property (nonatomic, strong) UIImage *largeImage;
@property (nonatomic, strong) UIImageView *largeImageView;
@property (nonatomic, assign) CGPoint largeImgViewCenter;

@property (nonatomic, strong) LYNavInteractiveAnimator *navInteractiveAnimator;
@property (nonatomic, strong) LYNavPopAnimator *navPopAnimator;

@end




@implementation SecondViewController

- (instancetype)initWithImage:(UIImage *)image beforeFrame:(CGRect)beforeFrame
{
    self = [super init];
    if (self) {
        self.largeImage = image;
        _beforeFrame = beforeFrame;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.largeImageView = [[UIImageView alloc] initWithFrame:[self imageViewFrameWithImage:self.largeImage]];
    self.largeImageView.image = self.largeImage;
    self.largeImageView.userInteractionEnabled = YES;
    [self.view addSubview:self.largeImageView];
    
    self.largeImgViewCenter = self.largeImageView.center;
    
    //
    self.navPopAnimator  = [[LYNavPopAnimator alloc] init];
    self.navPopAnimator.beforeFrame = _beforeFrame;
    self.navPopAnimator.afterFrame = self.largeImageView.frame;
    self.navPopAnimator.image = self.largeImage;

    self.navInteractiveAnimator = [[LYNavInteractiveAnimator alloc] init];
    self.navInteractiveAnimator.vc = self;
    
    self.navigationController.delegate = self;

    
    //拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.navInteractiveAnimator action:@selector(panGesutreAction:)];
    [self.largeImageView addGestureRecognizer:pan];
}

- (CGRect)imageViewFrameWithImage:(UIImage *)image
{
    float imgW = kScreenWidth;
    float imgH = imgW * image.size.height/image.size.width;
    float imgY = (kScreenHeight - imgH)/2;
    return CGRectMake(0, imgY, imgW, imgH);
}

#pragma mark - UINavigationControllerDelegate
//Pop（因为拖拽的时候就是pop的过程，所以也要实现pop）
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return self.navPopAnimator;
    }
    return nil;
}

//Interactive 向下拖拽返回上一层的动画代理
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if (self.navInteractiveAnimator.isPanning) {
        return self.navInteractiveAnimator;
    }
    return nil;
}

@end







