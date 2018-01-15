//
//  MeViewController.m
//  FirstApp
//
//  Created by hyz on 8/1/18.
//  Copyright © 2018年 hyz. All rights reserved.
//

#import "MeViewController.h"
#import "MyOneTableViewCell.h"
#import "MyTwoTableViewCell.h"
#import "PushViewController.h"
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property UITableView *tableView;
@property NSArray *tabelViewRowForSectionArray;
@property NSArray *rowHeightArray;
@property NSDictionary *cellTitleStringDic;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabelViewRowForSectionArray = @[@"1",@"1",@"4",@"1"];
    self.rowHeightArray = @[@"80",@"40",@"40",@"40"];
    self.cellTitleStringDic = @{@"1":@[@"钱包"],@"2":@[@"收藏",@"相册",@"卡包",@"表情"],@"3":@[@"设置"]};
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
        
        
    }];
    self.tableView.backgroundColor = [UIColor colorWithRed:235/256.f green:235/256.f blue:235/256.f alpha:1.0];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyOneTableViewCell class] forCellReuseIdentifier:@"one"];
    [self.tableView registerClass:[MyTwoTableViewCell class] forCellReuseIdentifier:@"two"];
    self.tableView.scrollEnabled = NO;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tabelViewRowForSectionArray[section] integerValue];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *resultCell;
    
    if (indexPath.section == 0) {
        MyOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"one"];
        [cell updateLayout];
        resultCell = cell ;
    }
    else {
        MyTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"two"];
        NSArray *cellTitleArray = [self.cellTitleStringDic objectForKey:[NSString stringWithFormat:@"%ld",indexPath.section]];
    
        [cell updateLayoutWithTitleString:cellTitleArray[indexPath.row]];
        resultCell = cell ;
    }
    resultCell.backgroundColor = [UIColor whiteColor];
    
    return resultCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:235/256.f green:235/256.f blue:235/256.f alpha:1.0];
    return view;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
    
    
    if ([[tableView cellForRowAtIndexPath:indexPath] isKindOfClass:[MyTwoTableViewCell class]]) {
        
        MyTwoTableViewCell *result = [tableView cellForRowAtIndexPath:indexPath];
        //KVC的使用
        NSLog(@"%@",[result valueForKeyPath:@"titleLable.text"]);
    }
    PushViewController *vc = [[PushViewController alloc]init];
    vc.view.backgroundColor = [UIColor yellowColor];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.rowHeightArray[indexPath.section] integerValue];
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
