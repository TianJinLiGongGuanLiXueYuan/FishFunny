//
//  FTLineView.m
//  FishTank
//
//  Created by Student07 on 16/7/22.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTLineView.h"
@implementation FTLineView
-(void)drawLineRect:(CGFloat)myBeginX Y:(CGFloat)myBeginY sX:(CGFloat)myStopX sY:(CGFloat)myStopY{
    //获得处理的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //指定直线样式
    CGContextSetLineCap(context,kCGLineCapSquare);
    //直线宽度
    CGContextSetLineWidth(context,2.0);
    //设置颜色
    CGContextSetRGBStrokeColor(context,1, 1, 1,1.0);
    //开始绘制
    CGContextBeginPath(context);
    //画笔移动到点(31,170)
    CGContextMoveToPoint(context,myBeginX,myBeginY);
    //下一点
    CGContextAddLineToPoint(context,myStopX,myStopY);
    //绘制完成
    CGContextStrokePath(context);
}
@end
