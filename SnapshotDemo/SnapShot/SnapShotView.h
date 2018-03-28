//
//  SnapShotView.h
//  SnapshotDemo
//
//  Created by Ios_Developer on 2018/3/28.
//  Copyright © 2018年 com.beiWei36du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnapShotView : UIView

-(instancetype)initWithFrame:(CGRect)frame fromeTheView:(UIView *)fView;

-(void)saveSnapShotView;
-(UIImage *)getShotView;
@end
