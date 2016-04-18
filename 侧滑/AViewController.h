//
//  AViewController.h
//  侧滑
//
//  Created by Moon on 16/4/15.
//  Copyright © 2016年 Moon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Left_ViewController.h"
#import "ViewController_00.h"
@interface AViewController : UIViewController{
    CGFloat scalef;
}
@property (nonatomic,strong) UIViewController *LeftController;

@property (nonatomic,strong) UIViewController *MainController;
@property (nonatomic,strong) UIImage          *BackImage;
@property (assign,nonatomic) CGFloat          speedf;

//是否允许点击视图恢复视图位置。默认为yes
@property (strong) UITapGestureRecognizer *tapGes;


-(instancetype)initWithLeftView:(UIViewController*)LeftView
                    andMainView:(UIViewController*)MainView
             andBackgroundImage:(UIImage*)Image;
//显示左边视图
-(void)showLeftConltroller;

//显示主视图
-(void)showMainController;


@end
