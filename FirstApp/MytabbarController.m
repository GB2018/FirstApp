//
//  MytabbarController.m
//  FirstApp
//
//  Created by hyz on 8/1/18.
//  Copyright © 2018年 hyz. All rights reserved.
//

#import "MytabbarController.h"
@interface MytabbarController ()

@end

@implementation MytabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *className = @[@"ViewController",@"MeViewController"];
    NSArray *titleArray = @[@"Main",@"Me"];
    for (int i = 0; i < className.count ; i ++) {
        
        Class c = NSClassFromString(className[i]);
        UIViewController *vc = [[c alloc]init];
        UINavigationController *nac = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.title = titleArray[i];
        nac.tabBarItem.title = titleArray[i];
        
        [self addChildViewController:nac];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
