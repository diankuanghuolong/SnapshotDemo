//
//  ViewController.m
//  SnapshotDemo
//
//  Created by Ios_Developer on 2018/3/28.
//  Copyright © 2018年 com.beiWei36du. All rights reserved.
//

#import "ViewController.h"

#import "SnapShotView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"截屏";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 60, 30)];
    [btn setTitle:@"截屏" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(snapShot:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
}

#pragma mark ===== action =====
-(void)snapShot:(id)sender
{
    UIWindow*screenWindow = [[UIApplication sharedApplication] keyWindow];
    
    SnapShotView *snapShotV = [[SnapShotView alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width - 20, self.view.frame.size.height - 250) fromeTheView:screenWindow];
    [snapShotV saveSnapShotView];
    snapShotV.layer.borderWidth = 1;
    snapShotV.layer.borderColor = [UIColor blackColor].CGColor;
    
    //
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, snapShotV.frame.size.width, snapShotV.frame.size.height)];
    iv.image = [snapShotV getShotView];
    [snapShotV addSubview:iv];
    
    [self.view addSubview:snapShotV];
}

@end
