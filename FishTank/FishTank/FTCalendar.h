//
//  FDCalendar.h
//  FDCalendarDemo
//
//  Created by fergusding on 15/8/20.
//  Copyright (c) 2015年 fergusding. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FTCalendarDelegate <NSObject>
-(void)DismissWithDate:(NSString *)date;
@end
@interface FTCalendar : UIView

- (instancetype)initWithCurrentDate:(NSDate *)date;
@property(nonatomic,weak) id <FTCalendarDelegate> delegate;
@end
