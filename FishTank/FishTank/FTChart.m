//
//  FTChart.m
//  FishTank
//
//  Created by Student03 on 16/7/21.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTChart.h"

#define PI 3.14159265358979323846

@implementation FTChart
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xede9e9);
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
//    [self.delegate MakeArray];
//PH点
   CGContextRef context = UIGraphicsGetCurrentContext();
   CGContextMoveToPoint(context, Xwidth, 310);
   CGContextAddLineToPoint(context, 3*Xwidth, 300);
   CGContextAddLineToPoint(context, 5*Xwidth, 280);
    CGContextAddLineToPoint(context, 7*Xwidth, 290);
    CGContextAddLineToPoint(context, 9*Xwidth, 260);
   CGContextSetLineWidth(context, 2.0);
   CGFloat components2[] = {0,0,205,1.0f};
   CGContextSetStrokeColor(context, components2);
   CGContextStrokePath(context);
    
 //温度点
    CGContextMoveToPoint(context, Xwidth, 340);
    CGContextAddLineToPoint(context, 3*Xwidth, 300);
    CGContextAddLineToPoint(context, 5*Xwidth, 270);
    CGContextAddLineToPoint(context, 7*Xwidth, 320);
    CGContextAddLineToPoint(context, 9*Xwidth, 300);
    CGContextSetLineWidth(context, 2.0);
    CGFloat components3[] = {0,255,255,1.0f};
    CGContextSetStrokeColor(context, components3);
    CGContextStrokePath(context);
    
  //氧浓度点
    CGContextMoveToPoint(context, Xwidth, 300);
    CGContextAddLineToPoint(context, 3*Xwidth, 350);
    CGContextAddLineToPoint(context, 5*Xwidth, 390);
    CGContextAddLineToPoint(context, 7*Xwidth, 310);
    CGContextAddLineToPoint(context, 9*Xwidth, 400);
    CGContextSetLineWidth(context, 2.0);
    CGFloat components4[] = {255,0,255,1.0f};
    CGContextSetStrokeColor(context, components4);
    CGContextStrokePath(context);
    //描述线
    CGContextMoveToPoint(context, Xwidth, 3*Yheight+20);
    CGContextAddLineToPoint(context, Xwidth+30, 3*Yheight+20);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColor(context, components2);
    CGContextStrokePath(context);
    
    
    CGContextMoveToPoint(context, 5*Xwidth+20, 3*Yheight+20);
    CGContextAddLineToPoint(context, 5*Xwidth+50, 3*Yheight+20);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColor(context, components3);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, Xwidth, 3*Yheight+65);
    CGContextAddLineToPoint(context, Xwidth+30, 3*Yheight+65);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColor(context, components4);
    CGContextStrokePath(context);
    //坐标
    CGContextSetRGBStrokeColor(context,0,0,0,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.5);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(context, 9*Xwidth, 3*Yheight-30, 1.5, 0, 2*PI, 0);
    CGContextAddArc(context, 7*Xwidth, 3*Yheight-30, 1.5, 0, 2*PI, 0);
    CGContextAddArc(context, 5*Xwidth, 3*Yheight-30, 1.5, 0, 2*PI, 0);
    CGContextAddArc(context, 3*Xwidth, 3*Yheight-30, 1.5, 0, 2*PI, 0);
    CGContextAddArc(context, Xwidth, 3*Yheight-30, 1.0, 0, 2*PI, 0); //添加一个圆
    CGContextAddArc(context, Xwidth, Yheight-30, 1.0, 0, 2*PI, 0);
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
   }

@end
