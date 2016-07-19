//
//  FTAboutUsViewController.m
//  FishTank
//
//  Created by Student03 on 16/7/14.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTAboutUsViewController.h"
#import "FTUserViewController.h"
@interface FTAboutUsViewController ()
@property(nonatomic,strong) UILabel *label;
@end

@implementation FTAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"关于我们";
    [self.view addSubview:self.label];
    UIBarButtonItem *aboutusleftBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(aboutusbackBtnClick)];
    self.navigationItem.leftBarButtonItem  = aboutusleftBtn;

}

-(UILabel *)label{
    if(!_label){
    _label=[[UILabel alloc]initWithFrame:CGRectMake(0, -190, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        _label.lineBreakMode = UILineBreakModeHeadTruncation;
        _label.numberOfLines = 0;
        _label.font = [UIFont systemFontOfSize:20];
    _label.text=@"Cras gravida vel ex at consectetur. \nAliquam vel volutpat ante. Integer id \ntempor eros, at lobortis augue. Etiam \nipsum mi, placerat eget urna at, placerat \nsodales lorem. Donec accumsan tempus \njusto at hendrerit. Donec varius venenatis\n molestie. Sed volutpat nunc lorem.";
    }
    return _label;
}
-(void)aboutusbackBtnClick{
//    FTUserViewController *aboutusbackVC = [[FTUserViewController alloc]init];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
