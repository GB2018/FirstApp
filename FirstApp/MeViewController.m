//
//  MeViewController.m
//  FirstApp
//
//  Created by hyz on 8/1/18.
//  Copyright © 2018年 hyz. All rights reserved.
//

#import "MeViewController.h"
#import "MyOneTableViewCell.h"
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property UITableView *tableView;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
        
        
    }];
    self.tableView.backgroundColor = [UIColor greenColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyOneTableViewCell class] forCellReuseIdentifier:@"one"];
    self.tableView.rowHeight = 60;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"one"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell updateLayout];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
    
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
