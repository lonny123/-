//
//  Left_ViewController.h
//  侧滑
//
//  Created by Moon on 16/4/15.
//  Copyright © 2016年 Moon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol leftViewDelegate <NSObject>

-(void)leftViewDidSelectedRow:(NSInteger)indexPathRow;

@end



@interface Left_ViewController : UIViewController
@property (nonatomic,weak)  id<leftViewDelegate>Delegate;
@end

