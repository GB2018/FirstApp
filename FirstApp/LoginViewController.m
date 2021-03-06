//
//  LoginViewController.m
//  FirstApp
//
//  Created by hyz on 1/1/18.
//  Copyright © 2018年 hyz. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
@property UITextField *userTF;
@property UITextField *passwordTF;
@end

@implementation LoginViewController

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
    
    [logoLable setText:@"FirstApp"];
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
    
    self.userTF.placeholder = @" 请输入账号";
    self.userTF.backgroundColor = [UIColor whiteColor];
    self.userTF.layer.borderColor = [UIColor grayColor].CGColor;
    self.userTF.layer.borderWidth = 1;
    self.userTF.layer.cornerRadius = 10;
    //self.userTF.layer.shouldRasterize = YES;
    self.userTF.returnKeyType = UIReturnKeyNext;
    self.userTF.delegate = self;
    self.userTF.tag = 101;
    self.passwordTF.placeholder = @" 请输入密码";
    self.passwordTF.backgroundColor = [UIColor whiteColor];
    self.passwordTF.layer.borderColor = [UIColor grayColor].CGColor;
    self.passwordTF.layer.borderWidth = 1;
    self.passwordTF.layer.cornerRadius = 10;
    self.passwordTF.secureTextEntry = YES;
    //self.passwordTF.layer.shouldRasterize = YES;
    self.passwordTF.returnKeyType = UIReturnKeyDefault;
    self.passwordTF.delegate = self;
    self.passwordTF.tag = 102;
    UIButton *loginBtn = [[UIButton alloc]init];
    [self.view addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.equalTo(self.passwordTF.mas_bottom).offset(50);
        make.height.mas_equalTo(40);
    }];
    
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor greenColor]];
    [loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *phoneLoginBtn = [[UIButton alloc]init];
    [self.view addSubview:phoneLoginBtn];
    
    [phoneLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.equalTo(loginBtn.mas_centerX).offset(-10);
        make.top.equalTo(loginBtn.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    [phoneLoginBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
    [phoneLoginBtn setBackgroundColor:[UIColor greenColor]];
    [phoneLoginBtn addTarget:self action:@selector(clickphoneLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *forgetPasswordBtn = [[UIButton alloc]init];
    [self.view addSubview:forgetPasswordBtn];
    
    [forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loginBtn.mas_centerX).offset(10);
        make.right.mas_equalTo(-20);
        make.top.equalTo(loginBtn.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];
    
    [forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPasswordBtn setBackgroundColor:[UIColor greenColor]];
    [forgetPasswordBtn addTarget:self action:@selector(clickforgetPasswordBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    

    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.returnKeyType == UIReturnKeyDefault) {
        [self clickLoginBtn];
        return YES;
    }
    else if (textField.returnKeyType == UIReturnKeyNext)
    {
        if (textField.tag < 102) {
            NSInteger nextTag = textField.tag + 1;
            UITextField *nextTextField = [self.view viewWithTag:nextTag];
            [textField resignFirstResponder];
            [nextTextField becomeFirstResponder];
            NSLog(@"下一个成为第一响应者");
        }
        NSLog(@"下一个");
        return YES;
    }
    return NO;
}

- (void)clickLoginBtn
{
    NSLog(@"登录");
}

- (void)clickphoneLoginBtn
{
    NSLog(@"手机登录");
}

- (void)clickforgetPasswordBtn
{
    NSLog(@"忘记密码");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if (touch.view == self.view) {
        NSLog(@"点击屏幕");
        [self.view endEditing:YES];
    }
    
    
    
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
