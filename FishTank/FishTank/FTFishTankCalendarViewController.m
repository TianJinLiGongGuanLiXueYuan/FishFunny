//
//  FTFishTankCalendarViewController.m
//  FishTank
//
//  Created by Student03 on 16/7/19.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTFishTankCalendarViewController.h"
#import "FTCalendar.h"
#import "FTFishInfoCalendarViewController.h"
@interface FTFishTankCalendarViewController ()<FTCalendarDelegate>
@property (nonatomic,strong)FTCalendar *calendar;
@end

@implementation FTFishTankCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.view.backgroundColor=UIColorFromRGB(0xede9e9);
    self.calendar = [[FTCalendar alloc] initWithCurrentDate:[NSDate date]];
    CGRect frame = self.calendar.frame;
    frame.origin.y = 20;
    //////////////////////////////////////////////////////签代理
    self.calendar.delegate = self;
    /////////////////////////////////////////////////////
    self.calendar.frame = frame;
    self.title=@"鱼缸日历";
    [self.view addSubview:self.calendar];

}
#pragma  mark - 点击事件

-(void)DismissWithDate:(NSString *)date{
//    NSString *str = date;
//    NSLog(@"%@",str);
    FTFishInfoCalendarViewController *infoVC=[[FTFishInfoCalendarViewController alloc]init];
    infoVC.date=date;
    [self.navigationController pushViewController:infoVC animated:YES];
    

//    NSLog(@"就是这个了%@",str);

    
}

@end
