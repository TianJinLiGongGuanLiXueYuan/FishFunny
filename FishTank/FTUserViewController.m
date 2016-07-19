//
//  FTUserViewController.m
//  FishTank
//
//  Created by 天津财经大学信科二 on 16/7/13.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTUserViewController.h"
#import "FTMyFishBallViewController.h"
#import "FTAboutUsViewController.h"
@interface FTUserViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *personalTableView;
@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation FTUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    // Do any additional setup after loading the view.
    _personalTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStyleGrouped];
    [self.view addSubview:_personalTableView];
    _personalTableView.delegate = self;
    _personalTableView.dataSource = self;
    _personalTableView.showsVerticalScrollIndicator = NO;
    _personalTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _dataSource=@[@"鱼缸日历",@"我的鱼缸",@"清除缓存",@"关于我们"];
    
}
//区域分块
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else  {
        return _dataSource.count;
    }
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 20;
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==1) {
        return 40;
    }
    return 20;
}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 80;
    }
    return 40;
}
//设置每行cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.textLabel.text=_dataSource[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section==0) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(12, 0, 80, 80)];
        imageView.image=[UIImage imageNamed:@"usericon.png"];
        [cell.contentView addSubview:imageView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 0, 60, 80)];
        nameLabel.text=@"昵称";
        [cell.contentView addSubview:nameLabel];
    }else{
        cell.textLabel.text=_dataSource[indexPath.row];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        
        [cell.contentView addSubview:cell.textLabel];
        
    }
    return cell;
}
//每一行的响应事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        NSLog(@"nicheng");
    }
    else
        
    {
        switch (indexPath.row) {
            case 0:
                NSLog(@"鱼缸日历");
                break;
            case 1:{                FTMyFishBallViewController *FTMyFishBallVC = [[FTMyFishBallViewController alloc]init];
                [self.navigationController pushViewController:FTMyFishBallVC animated:YES];
            }
                
                break;
            case 2:{
                UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定要清除" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alertview show];
                
            }
                
                break;
            case 3:{
                FTAboutUsViewController *aboutusVC = [[FTAboutUsViewController alloc]init];
                [self.navigationController pushViewController:aboutusVC animated:YES];
                
                
            }
                
                break;
            default:
                break;
        }
    }
}

@end
