//
//  SnapShotView.m
//  SnapshotDemo
//
//  Created by Ios_Developer on 2018/3/28.
//  Copyright © 2018年 com.beiWei36du. All rights reserved.
//

#import "SnapShotView.h"

@interface SnapShotView()
{
    UIView *_snapShotView;
    UIImage *_shotImg;
}

@end

@implementation SnapShotView

-(instancetype)initWithFrame:(CGRect)frame fromeTheView:(UIView *)fView
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _snapShotView = fView;
        
        //    捏合手势
        UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
        [self addGestureRecognizer:pinchGesture];
    }
    return self;
}

#pragma mark  =====  action  =====
-(void)saveSnapShotView
{
    UIImageWriteToSavedPhotosAlbum([self getSnapShotView], nil, nil, nil);//保存图片到照片
}
-(UIImage *)getSnapShotView
{
//    UIGraphicsBeginImageContext(_snapShotView.frame.size);//矢量图（这样截图不清晰）
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(_snapShotView.frame.size.width,_snapShotView.frame.size.height), YES, 0);//创建一个基于位图的图形上下文并指定大小为
    [[_snapShotView layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
    
    _shotImg = viewImage;
    return viewImage;
}
-(UIImage *)getShotView
{
    return _shotImg;
}

#pragma mark  ===== 手势  =====
- (void)pinchGesture:(id)sender
{
    UIPinchGestureRecognizer *pinchGesture = sender;
    if (pinchGesture.state == UIGestureRecognizerStateChanged)
    {
        pinchGesture.view.transform = CGAffineTransformMakeScale(pinchGesture.scale, pinchGesture.scale);
    }
    if (pinchGesture.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.5 animations:^{
            pinchGesture.view.transform = CGAffineTransformIdentity;
        }];
    }
}
@end
