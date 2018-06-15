//
//  SecondViewController.m
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/14.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UIImage *largeImage;


@end




@implementation SecondViewController

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.largeImage = image;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[self imageViewFrameWithImage:self.largeImage]];
    imageView.image = self.largeImage;
    [self.view addSubview:imageView];
}

- (CGRect)imageViewFrameWithImage:(UIImage *)image
{
    float imgW = kScreenWidth;
    float imgH = imgW * image.size.height/image.size.width;
    float imgY = (kScreenHeight - imgH)/2;
    return CGRectMake(0, imgY, imgW, imgH);
}


@end
