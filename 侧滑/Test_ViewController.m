//
//  Test_ViewController.m
//  侧滑
//
//  Created by Moon on 16/4/18.
//  Copyright © 2016年 Moon. All rights reserved.
//

#import "Test_ViewController.h"

#import "Main_ViewController.h"
#import "Left_ViewController.h"
#import "AViewController.h"
@interface Test_ViewController ()

@end

@implementation Test_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Left_ViewController *left = [[Left_ViewController alloc]init];
  // UINavigationController *nan1 = [[UINavigationController alloc]initWithRootViewController:left];
    
    Main_ViewController *main = [[Main_ViewController alloc]init];
      UINavigationController *nan = [[UINavigationController alloc]initWithRootViewController:main];
    
    AViewController *avView = [[AViewController alloc]initWithLeftView:left andMainView:nan andBackgroundImage:[UIImage imageNamed:@"123.jpg"]];
    
    [avView showLeftConltroller];
    [self addChildViewController:avView];
    [self.view addSubview:avView.view];
    // Do any additional setup after loading the view.
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
