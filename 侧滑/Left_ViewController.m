//
//  Left_ViewController.m
//  侧滑
//
//  Created by Moon on 16/4/15.
//  Copyright © 2016年 Moon. All rights reserved.
//

#import "Left_ViewController.h"
#import "UIView+SDAutoLayout.h"
#import "ViewController_00.h"
#import "Main_ViewController.h"
@interface Left_ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableVieww;
    UIButton *head;
    UILabel *name;
    NSArray *array;
}

@end

@implementation Left_ViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES; 
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor colorWithRed:0.129 green:0.118 blue:0.098 alpha:1.00];
    
    [self views];
    [self lay];
    tableVieww.scrollEnabled = NO;
    tableVieww.delegate = self;
    tableVieww.dataSource = self;
    array = [NSMutableArray arrayWithObjects:@"新闻资讯",@"职业相关",@"查询助手",@"游戏视频",@"时装模拟",@"真人秀",@"周边娱乐",@"个人中心",@"系统设置", nil];
    // Do any additional setup after loading the view.
}
-(void)views{
    head = [UIButton buttonWithType:UIButtonTypeCustom];
    head.backgroundColor = [UIColor redColor];
    [head addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:head];
    
    name = [[UILabel alloc]init];
    name.text = @"清风揽月";
    name.textColor = [UIColor whiteColor];
    [self.view addSubview:name];
    
    tableVieww = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    tableVieww.backgroundColor = [UIColor colorWithRed:0.129 green:0.118 blue:0.098 alpha:1.00];
    
    [self.view addSubview:tableVieww];
   
    
}
-(void)lay{
    head.sd_layout
     .topSpaceToView(self.view ,15)
     .leftSpaceToView(self.view ,10)
     .widthIs(50)
    .heightEqualToWidth();
    head.layer.masksToBounds = YES;
    head.layer.cornerRadius = head.frame.size.width/2;
    
    name.sd_layout
     .topSpaceToView(self.view,15)
     .leftSpaceToView(head,5)
     .widthIs(100)
    .heightIs(40);
    
    
    tableVieww.sd_layout
     .leftSpaceToView(self.view,0)
     .topSpaceToView(self.view,68)
     .widthIs(190)
    .heightIs(self.view.frame.size.height);
    
}
-(void)show{
  //跳转个人中心
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell = @"cell";
    UITableViewCell *tcell = [tableView dequeueReusableCellWithIdentifier:cell];
    if (tcell == nil) {
        tcell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    }
    
    tcell.textLabel.text = [array objectAtIndex:indexPath.row];
    tcell.textLabel.textAlignment = NSTextAlignmentLeft;
    tcell.textLabel.textColor = [UIColor whiteColor];
    tcell.backgroundColor = [UIColor colorWithRed:0.129 green:0.118 blue:0.098 alpha:1.00];
    return tcell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableVieww deselectRowAtIndexPath:indexPath animated:NO];
    
    if (self.Delegate && [self.Delegate respondsToSelector:@selector(leftViewDidSelectedRow:)]) {
        [self.Delegate leftViewDidSelectedRow:indexPath.row];
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
