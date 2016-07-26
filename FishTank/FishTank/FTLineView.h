//
//  FTLineView.h
//  FishTank
//
//  Created by Student07 on 16/7/22.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTLineView : UIView
//声明划线的方法
-(void)drawLineRect:(CGFloat)myBeginX Y:(CGFloat)myBeginY sX:(CGFloat)myStopX sY:(CGFloat)myStopY;
@end
