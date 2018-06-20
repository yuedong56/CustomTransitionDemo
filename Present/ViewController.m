//
//  ViewController.m
//  Present
//
//  Created by yuedongkui on 2018/6/19.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end





@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (IBAction)presentButtonAction:(id)sender
{
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
