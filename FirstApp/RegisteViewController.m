//
//  RegisteViewController.m
//  FirstApp
//
//  Created by hyz on 1/1/18.
//  Copyright © 2018年 hyz. All rights reserved.
//

#import "RegisteViewController.h"

@interface RegisteViewController ()<UITextFieldDelegate>
@property UITextField *userTF;
@property UITextField *passwordTF;
@property UITextField *secondPassWordTF;
@end

@implementation RegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *logoLable = [[UILabel alloc]init];
    
    [self.view addSubview:logoLable];
    
    [logoLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(60);
        
    }];
    
    [logoLable setText:@"注册页面"];
    [logoLable setTextColor:[UIColor greenColor]];
    [logoLable setTextAlignment:NSTextAlignmentCenter];
    [logoLable setFont:[UIFont systemFontOfSize:60]];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.userTF = [[UITextField alloc]init];
    
    [self.view addSubview:self.userTF];
    
    [self.userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.equalTo(logoLable.mas_bottom).offset(100);
        make.height.mas_equalTo(40);
        
    }];
    
    
    self.passwordTF = [[UITextField alloc]init];
    
    [self.view addSubview:self.passwordTF];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.equalTo(self.userTF.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
        
    }];
    
    self.secondPassWordTF = [[UITextField alloc]init];
    
    [self.view addSubview:self.secondPassWordTF];
    
    [self.secondPassWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.equalTo(self.userTF.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
        
    }];
    
    
    self.userTF.placeholder = @" 请输入账号";
    self.userTF.backgroundColor = [UIColor whiteColor];
    self.userTF.layer.borderColor = [UIColor grayColor].CGColor;
    self.userTF.layer.borderWidth = 1;
    self.userTF.layer.cornerRadius = 10;
    //self.userTF.layer.shouldRasterize = YES;
    self.userTF.returnKeyType = UIReturnKeyNext;
    self.userTF.delegate = self;
    self.userTF.tag = 101;
    self.userTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.userTF.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTF.placeholder = @" 请输入密码";
    self.passwordTF.backgroundColor = [UIColor whiteColor];
    self.passwordTF.layer.borderColor = [UIColor grayColor].CGColor;
    self.passwordTF.layer.borderWidth = 1;
    self.passwordTF.layer.cornerRadius = 10;
    self.passwordTF.secureTextEntry = YES;
    //self.passwordTF.layer.shouldRasterize = YES;
    self.passwordTF.returnKeyType = UIReturnKeyNext;
    self.passwordTF.delegate = self;
    self.passwordTF.tag = 102;
    self.passwordTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.passwordTF.leftViewMode = UITextFieldViewModeAlways;
    
    self.secondPassWordTF.placeholder = @" 请输入密码";
    self.secondPassWordTF.backgroundColor = [UIColor whiteColor];
    self.secondPassWordTF.layer.borderColor = [UIColor grayColor].CGColor;
    self.secondPassWordTF.layer.borderWidth = 1;
    self.secondPassWordTF.layer.cornerRadius = 10;
    self.secondPassWordTF.secureTextEntry = YES;
    //self.passwordTF.layer.shouldRasterize = YES;
    self.secondPassWordTF.returnKeyType = UIReturnKeyNext;
    self.secondPassWordTF.delegate = self;
    self.secondPassWordTF.tag = 102;
    self.secondPassWordTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.secondPassWordTF.leftViewMode = UITextFieldViewModeAlways;
    
    UIButton *registeBtn = [[UIButton alloc]init];
    [self.view addSubview:registeBtn];
    
    [registeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.equalTo(self.secondPassWordTF.mas_bottom).offset(50);
        make.height.mas_equalTo(40);
    }];
    
    [registeBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registeBtn setBackgroundColor:[UIColor greenColor]];
    [registeBtn addTarget:self action:@selector(clickRegisteBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *quitBtn = [[UIButton alloc]init];
    [self.view addSubview:quitBtn];
    
    [quitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.equalTo(registeBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
    }];
    if (self.showLoginBackBtn) {
        [quitBtn setTitle:@"退出到登录页面" forState:UIControlStateNormal];
    }
    else
    {
        [quitBtn setTitle:@"取消" forState:UIControlStateNormal];
        
    }
    [quitBtn setBackgroundColor:[UIColor greenColor]];
    [quitBtn addTarget:self action:@selector(clickQuitBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)clickRegisteBtn{
    
    NSLog(@"注册");
}

- (void)clickQuitBtn{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
