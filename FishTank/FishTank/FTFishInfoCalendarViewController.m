//
//  FTFishInfoCalendarViewController.m
//  FishTank
//
//  Created by Student03 on 16/7/18.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTFishInfoCalendarViewController.h"
#import "FTChart.h"
@interface FTFishInfoCalendarViewController ()
//<FTChartDelegate>

@property(nonatomic,strong)UILabel *datelabel;
@property(nonatomic,strong)UILabel *PHlabel;
@property(nonatomic,strong)UILabel *Temlabel;
@property(nonatomic,strong)UILabel *Oxygenlabel;
@property(nonatomic,strong)UILabel *timelabel1;
@property(nonatomic,strong)UILabel *timelabel2;
@property(nonatomic,strong)UILabel *timelabel3;
@property(nonatomic,strong)UILabel *timelabel4;
@property(nonatomic,strong)UILabel *timelabel5;

@end

@implementation FTFishInfoCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColorFromRGB(0xede9e9);
    UIBarButtonItem *CalendarleftBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backBtnClick)];
    
    self.navigationItem.leftBarButtonItem  = CalendarleftBtn;
    self.title=@"图表";
    FTChart *Vc=[[FTChart alloc]init];
    Vc.frame=self.view.bounds;
    [self.view addSubview:Vc];
    [self setuptopView];
    

    
    _PHlabel=[[UILabel alloc]initWithFrame:CGRectMake(Xwidth+35, 3*Yheight+5, 30, 30)];
    _PHlabel.text=@"PH";
    _PHlabel.textColor=[UIColor colorWithRed:0 green:0 blue:205 alpha:1.0];
    [self.view addSubview:_PHlabel];
    
    _Temlabel=[[UILabel alloc]initWithFrame:CGRectMake(5*Xwidth+55, 3*Yheight+5, 120, 30)];
    _Temlabel.text=@"温度(摄氏度)";
    _Temlabel.textColor=[UIColor colorWithRed:0 green:255 blue:255 alpha:1.0];
    [self.view addSubview:_Temlabel];
   
    _Oxygenlabel=[[UILabel alloc]initWithFrame:CGRectMake(Xwidth+35, 3*Yheight+50, 120, 30)];
    _Oxygenlabel.text=@"含氧量(mg/L)";
    _Oxygenlabel.textColor=[UIColor colorWithRed:255 green:0 blue:255 alpha:1.0];
    [self.view addSubview:_Oxygenlabel];
    
    _timelabel1=[[UILabel alloc]initWithFrame:CGRectMake(Xwidth-20, 3*Yheight-30, 40, 30)];
    _timelabel1.text=@"00:00";
    _timelabel1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_timelabel1];
    
    _timelabel2=[[UILabel alloc]initWithFrame:CGRectMake(3*Xwidth-20, 3*Yheight-30, 40, 30)];
    _timelabel2.text=@"06:00";
    _timelabel2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_timelabel2];
    
    _timelabel3=[[UILabel alloc]initWithFrame:CGRectMake(5*Xwidth-20,3*Yheight-30, 40, 30)];
    _timelabel3.text=@"12:00";
    _timelabel3.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_timelabel3];
    
    _timelabel4=[[UILabel alloc]initWithFrame:CGRectMake(7*Xwidth-20, 3*Yheight-30, 40, 30)];
    _timelabel4.text=@"18:00";
    _timelabel4.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_timelabel4];
    
    _timelabel5=[[UILabel alloc]initWithFrame:CGRectMake(9*Xwidth-20, 3*Yheight-30, 40, 30)];
    _timelabel5.text=@"24:00";
    _timelabel5.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_timelabel5];
}
-(void)setuptopView{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
    titleView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:titleView];
    
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 10, 32, 24)];
    [leftButton setImage:[UIImage imageNamed:@"icon_previous"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(setPreviousDate) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:leftButton];
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(titleView.frame.size.width - 37, 10, 32, 24)];
    [rightButton setImage:[UIImage imageNamed:@"icon_next"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(setNextDate) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:rightButton];
    
    _datelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _datelabel.textColor = [UIColor whiteColor];
    _datelabel.text=self.date;
    _datelabel.font = [UIFont boldSystemFontOfSize:20];
    _datelabel.center = titleView.center;
    [self.view  addSubview:_datelabel];
}

-(void)setPreviousDate{

    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc]init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* inputDate = [inputFormatter dateFromString:_date];

    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yy-MM-dd"];
    NSTimeInterval interval = 60 * 60 * 24;
    _datelabel.text= [format stringFromDate:[inputDate initWithTimeInterval:-interval sinceDate:inputDate]];

    self.date=_datelabel.text;

    

}



-(void)setNextDate{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc]init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate* inputDate = [inputFormatter dateFromString:_date];

    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yy-MM-dd"];
    NSTimeInterval interval = 60 * 60 * 24;
   _datelabel.text= [format stringFromDate:[inputDate initWithTimeInterval:interval sinceDate:inputDate]];
    self.date=_datelabel.text;

}
-(void)backBtnClick{
   [self.navigationController popViewControllerAnimated:YES];
    
}
//-(void)MakeArray{
//    FTChart Vc=[[FTChart alloc]init];
//    Vc.delegate=self;
//    NSMutableArray *arr=[[NSMutableArray alloc]init];
//    for (int i=0; i<=14; i++) {
//        double y=(arc4random()%3*Yheight)+Yheight;
//        //        NSString *ValueString = [NSString stringWithFormat:@"%d", y];
//        [arr addObject:[NSNumber numberWithDouble:y]];
////        NSLog(@"%@",arr);
//    Vc.arr=arr;
//        [self.navigationController pushViewController:Vc animated:YES];
//    }
//}

@end
