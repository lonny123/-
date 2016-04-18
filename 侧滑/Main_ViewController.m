//
//  Main_ViewController.m
//  侧滑
//
//  Created by Moon on 16/4/15.
//  Copyright © 2016年 Moon. All rights reserved.
//

#import "Main_ViewController.h"
#import "UIView+SDAutoLayout.h"
@interface Main_ViewController ()
{
    UIView *nanView;
}
@end

@implementation Main_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"123.jpg"]];
    
    UIVisualEffect *effect;
    effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *viii;
    viii = [[UIVisualEffectView alloc]initWithEffect:effect];
    viii.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:viii];
    
    
  
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 30);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonTouch) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *ITE = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = ITE;
    // Do any additional setup after loading the view.
}
-(void)buttonTouch{
    //发送侧滑通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cehua" object:nil];
    
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
