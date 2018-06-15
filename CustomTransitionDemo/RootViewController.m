//
//  ViewController.m
//  CustomTransitionDemo
//
//  Created by yuedongkui on 2018/6/14.
//  Copyright © 2018年 YR. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) NSArray *lists;

@end



@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lists = @[@"系统", @"仿微信"];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.lists[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row)
    {
        case 0: {
            UIViewController *vc = [UIViewController new];
            [self.navigationController.view.layer addAnimation:[self pushAnimation] forKey:nil];//添加Animation
            [self.navigationController pushViewController:vc animated:NO];//记得这里的animated要设为NO，不然会重复
            
            /*
             //modal模态
             UIViewController *vc = [[UIViewController alloc] init];
             [self.view.window.layer addAnimation:[self presentAnimation] forKey:nil];//添加Animation
             [self presentViewController:vc animated:NO completion:nil];  //记得这里的animated要设为NO，不然会重复
             */
        } break;
        case 1: {
            FirstViewController *vc = [FirstViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        } break;
        default:break;
    }
}

#pragma mark -
- (CATransition *)pushAnimation
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.8;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    /*私有API
     cube                   立方体效果
     pageCurl               向上翻一页
     pageUnCurl             向下翻一页
     rippleEffect           水滴波动效果
     suckEffect             变成小布块飞走的感觉
     oglFlip                上下翻转
     cameraIrisHollowClose  相机镜头关闭效果
     cameraIrisHollowOpen   相机镜头打开效果
     */
    transition.type = @"cube";
    //transition.type = kCATransitionMoveIn;
    //下面四个是系统公有的API
    //kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    
    transition.subtype = kCATransitionFromRight;
    //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    return transition;
}


@end



