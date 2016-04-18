//
//  AViewController.m
//  侧滑
//
//  Created by Moon on 16/4/15.
//  Copyright © 2016年 Moon. All rights reserved.
//

#import "AViewController.h"
#import "UIView+Extensions.h"
#define kLeftViewH [UIScreen mainScreen].bounds.size.height
#define kLeftViewW ([UIScreen mainScreen].bounds.size.width * 0.5)
@interface AViewController ()<leftViewDelegate>

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) Left_ViewController *left;
@property (nonatomic, assign) CGFloat PanGestureNowX;
@end

@implementation AViewController
@synthesize tapGes;

-(instancetype)initWithLeftView:(UIViewController *)LeftView andMainView:(UIViewController *)MainView andBackgroundImage:(UIImage *)Image{
    if ( self ) {
        
    }
    self.LeftController = LeftView;
    self.MainController = MainView;

    [self setupLeftVC:LeftView];
    [self setupMainVC:MainView];
    
    self.BackImage      = Image;
    self.view.backgroundColor = [UIColor colorWithPatternImage:self.BackImage];
    //添加毛玻璃效果
    UIVisualEffect *effect;
    effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *viii;
    viii = [[UIVisualEffectView alloc]initWithEffect:effect];
    viii.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:viii];
    
    
    UIPanGestureRecognizer *MainPa = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(MainViewP:)];
    MainPa.accessibilityNavigationStyle = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:MainPa];
    
    //接收侧滑通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cehuaTouch) name:@"cehua" object:nil];
    
    //单机手势
//    tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(danji:)];
//    [tapGes setNumberOfTapsRequired:1];
    //[MainView.view addGestureRecognizer:tapGes];
    
    [self.view addSubview:_LeftController.view];
    [self.view addSubview:_MainController.view];
    return self;
    
}
- (void)setupLeftVC:(UIViewController *)leftVC{
    _left  = leftVC;
    
    [self addChildViewController:leftVC];
    [self.view addSubview:leftVC.view];
    _left.view.y = 20;
    _left.view.x = -kLeftViewW/2;
    _left.view.height = kLeftViewH;
    _left.view.width = kLeftViewW;
    _left.Delegate = self;
    
}
- (void)setupMainVC:(UIViewController *)mainVC
{
    _MainController = mainVC;
    
    [self addChildViewController:mainVC];
    [self.view addSubview:mainVC.view];
}

- (void)onClickCover:(UIButton *)cover
{
    [UIView animateWithDuration:0.2 animations:^{
        _MainController.view.x = 0;
        _left.view.x = -kLeftViewW/2;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
}
-(void)showLeftConltroller{
    [self cehuaTouch];
}
-(void)cehuaTouch{
    UIView *mainView = _MainController.view;
    UIView *leftView = _left.view;
    
    [UIView animateWithDuration:0.2 animations:^{
        mainView.x = kLeftViewW;
        leftView.x = 0;
        [self setAlphaWithLeftView:leftView OffsetX:0];
    }];
    
    //添加遮盖
    UIButton *cover = [mainView viewWithTag:3344];
    if (!cover) {
        cover = [[UIButton alloc] initWithFrame:mainView.bounds];
        cover.tag = 123;
        [cover addTarget:self action:@selector(onClickCover:) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:cover];
    }

    
}
- (void)setAlphaWithLeftView:(UIView *)leftView OffsetX:(CGFloat)offsetX{
    leftView.alpha = 1 - offsetX/-(kLeftViewW/2);
}
-(void)MainViewP:(UIPanGestureRecognizer*)panView{
    UIView *mainView = _MainController.view;
    UIView *leftView = _LeftController.view;
    
    //判断最终位置
    if (panView.state == UIGestureRecognizerStateEnded) {
        if (mainView.x > kLeftViewW/2) {
            [UIView animateWithDuration:0.2 animations:^{
                mainView.x = kLeftViewW;
                leftView.x = 0;
            }];
            //添加遮盖
            UIButton *cover = [mainView viewWithTag:123];
            if (!cover) {
                cover = [[UIButton alloc] initWithFrame:mainView.bounds];
                cover.tag = 123;
                [cover addTarget:self action:@selector(onClickCover:) forControlEvents:UIControlEventTouchUpInside];
                [mainView addSubview:cover];
            }

            
            
        }else{
            [UIView animateWithDuration:0.2 animations:^{
                mainView.x = 0;
                leftView.x =-kLeftViewW/2;
            }];
            
            UIButton *cover = [mainView viewWithTag:123];
            if (cover) {
                [self onClickCover:cover];
            }
        }
    }
    
   _PanGestureNowX = [panView translationInView:self.view].x;
    
    [panView setTranslation:CGPointZero inView:self.view];
    [self animateWithDuration:0.2 Transform:_PanGestureNowX mainView:mainView leftView:leftView];
    
}

- (void)animateWithDuration:(CGFloat)duration Transform:(CGFloat)offsetX mainView:(UIView *)mainView leftView:(UIView *)leftView{
    
    mainView.x += offsetX;
    leftView.x += offsetX/2;
    if (mainView.x > kLeftViewW) {
        mainView.x = kLeftViewW;
    }else if (mainView.x < 0){
        mainView.x = 0;
    }
    
    if (leftView.x > 0) {
        leftView.x = 0;
    }else if (leftView.x < -kLeftViewW/2){
        leftView.x = -kLeftViewW/2;
    }
    
    [self setAlphaWithLeftView:leftView OffsetX:leftView.x];
}



//代理
-(void)leftViewDidSelectedRow:(NSInteger)indexPathRow{
    NSLog(@"%d",indexPathRow);
    UIButton *cover = [_MainController.view viewWithTag:123];
    [self onClickCover:cover];
    if (indexPathRow == 0) {
        ViewController_00 *view0 = [[ViewController_00 alloc]init];
        [self pushView:view0];
    }
    
}
-(void)pushView:(UIViewController *)view{
    UINavigationController *nan = (UINavigationController*)_MainController;
    [nan popToRootViewControllerAnimated:NO];
    [nan pushViewController:view animated:NO];
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
