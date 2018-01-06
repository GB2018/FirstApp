//
//  ViewController.m
//  FirstApp
//
//  Created by hyz on 1/1/18.
//  Copyright © 2018年 hyz. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *pushLoginViewControllerButton = [[UIButton alloc]init];
    
    [self.view addSubview:pushLoginViewControllerButton];
    
    [pushLoginViewControllerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(200);
        make.height.mas_equalTo(40);
    }];
    
    [pushLoginViewControllerButton setBackgroundColor:[UIColor greenColor]];
    [pushLoginViewControllerButton setTitle:@"弹出登录页面" forState:UIControlStateNormal];
    [pushLoginViewControllerButton addTarget:self action:@selector(clickPushLoginViewControllerButton) forControlEvents:UIControlEventTouchUpInside];
 
}

- (void)clickPushLoginViewControllerButton
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
