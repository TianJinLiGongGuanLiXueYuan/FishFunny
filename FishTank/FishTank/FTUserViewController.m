//
//  FTUserViewController.m
//  FishTank
//
//  Created by 天津财经大学信科二 on 16/7/13.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//
#define ScreenWidth  self.view.frame.size.width
#define ScreenHeight self.view.frame.size.height
#define  HeadX      (ScreenWidth-0.25*ScreenWidth)/2
#define  HeadY        80
#define HeadWidth     0.25*ScreenWidth
#define HeadHeight    0.25*ScreenWidth
#import "FTUserViewController.h"
#import "FTMyFishBallViewController.h"
#import "FTAboutUsViewController.h"
#import "FTFishTankCalendarViewController.h"
#import "FTFishInfoCalendarViewController.h"
#import "FTUserInfoViewController.h"
@interface FTUserViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate>


@property (nonatomic,strong) UITableView *personalTableView;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) NSString *nickname;
@property (nonatomic,strong) UIImageView *UserImage;
@property (nonatomic,strong) UIButton *UserImageBtn;
@end
@interface FTUserViewController (){
    FTFishTankCalendarViewController *dater;
}
@end
@implementation FTUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromRGB(0xede9e9);
    _personalTableView = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth/2-[UIScreen mainScreen].bounds.size.width*0.425, 100, [UIScreen mainScreen].bounds.size.width*0.85, [UIScreen mainScreen].bounds.size.height-64) style:UITableViewStyleGrouped];
    _personalTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_personalTableView];
    _personalTableView.delegate = self;
    _personalTableView.dataSource = self;
    _personalTableView.showsVerticalScrollIndicator = NO;
    _personalTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _dataSource=@[@"鱼缸日历",@"管理我的鱼缸",@"清除缓存",@"关于我们"];
    //头像
    self.UserImage =[[UIImageView alloc] initWithFrame:CGRectMake( (ScreenWidth-0.25*self.view.frame.size.width) / 2,100,0.25*self.view.frame.size.width ,0.25*self.view.frame.size.width )];
    [self.UserImage setImage:[UIImage imageNamed:@"user.png"]];
    _UserImage.layer.cornerRadius =HeadHeight/2;
    _UserImage.layer.masksToBounds=YES;
    [self.view addSubview:self.UserImage];
}
//区域分块
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else  if (section==1) {
        return _dataSource.count;
    }else{
        return 1;
    }
}

//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==1) {
        return 40;
    }
    return 60;
}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 60;
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
        [cell  setIndentationWidth:[UIScreen mainScreen].bounds.size.width*0.8 ];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor =[UIColor colorWithRed:237 green:233 blue:233 alpha:0.9];
        cell.layer.cornerRadius = 6;
        cell.layer.masksToBounds = YES;

    }
    
    if (indexPath.section==0&&indexPath.row==0) {
        cell.textLabel.text = @"修改昵称";
        [cell.contentView addSubview:cell.textLabel];
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(cell.center.x + 100, cell.center.y - 10, 80, 40)];
//        nameLabel.layer.borderWidth = 1.0f;
//        nameLabel.layer.borderColor = [[UIColor blackColor]CGColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.text = @"Mr.李";
        [cell.contentView addSubview:nameLabel];
    }

     else if (indexPath.section==0 && indexPath.row==1) {
         cell.textLabel.text = @"修改头像";
         [cell.contentView addSubview:cell.textLabel];
         UIButton *Userimage=[[UIButton alloc]initWithFrame:CGRectMake(cell.center.x + 100, cell.center.y - 10, 80, 40)];
//         Userimage.backgroundColor = [UIColor redColor];
         [Userimage setBackgroundImage:[UIImage imageNamed:@"1.png" ] forState:UIControlStateNormal];
         [Userimage setTitle:@"上传" forState:UIControlStateNormal];
         [Userimage setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [Userimage addTarget:self action:@selector(Userimageclick) forControlEvents:UIControlEventTouchUpInside];
         [cell.contentView addSubview:Userimage];
        }
     else if(indexPath.section==1){
        cell.textLabel.text=_dataSource[indexPath.row];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [cell.contentView addSubview:cell.textLabel];
        
    }
    else{
        cell.textLabel.text = @"退出登录";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        [cell.contentView addSubview:cell.textLabel];
    }
    return cell;
}

//每一行的响应事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:{
                FTUserInfoViewController *userInfo = [[FTUserInfoViewController alloc]init];
                [self.navigationController pushViewController:userInfo animated:YES];
            }
                break;
                
            default:

                break;
        }
    }
    else if (indexPath.section==1)
        
    {
        switch (indexPath.row) {
            case 0:{
                //dater=[[FTFishTankCalendar alloc]initWithFrame:CGRectZero];
                //dater.delegate=self;
                //[dater showInView:self.view animated:YES];
                FTFishTankCalendarViewController *cv = [[FTFishTankCalendarViewController alloc]init];
                [self.navigationController pushViewController:cv animated:YES];
            }
                break;
            case 1:{                FTMyFishBallViewController *FTMyFishBallVC = [[FTMyFishBallViewController alloc]init];
                [self.navigationController pushViewController:FTMyFishBallVC animated:YES];
            }
                
                break;
            case 2:{
                UIAlertController *alertContrller1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要清除" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
                    NSLog(@"点击了取消");
                }];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    NSLog(@"点击了确定");
                    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
                    NSString *path=[[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
                    NSFileManager *fileManager=[NSFileManager defaultManager];
                    
                    if ([fileManager fileExistsAtPath:path]) {
                        NSArray *childerFiles=[fileManager subpathsAtPath:path];
                        for (NSString *fileName in childerFiles) {
                            //如有需要，加入条件，过滤掉不想删除的文件
                            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
                            [fileManager removeItemAtPath:absolutePath error:nil];
                            NSLog(@"成功");
                        }
                    }else{
                        NSLog(@"失败");
                    }
                }];
                [alertContrller1 addAction:cancelAction];
                [alertContrller1 addAction:okAction];
                [self presentViewController:alertContrller1 animated:YES completion:nil];
            }
            
                break;
            default:{
                FTAboutUsViewController *aboutusVC = [[FTAboutUsViewController alloc]init];
                [self.navigationController pushViewController:aboutusVC animated:YES];
            }
                
                
                break;
        }
    }else if (indexPath.section==2&&indexPath.row==0) {
        UIAlertController *alertContrller2 = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要退出" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            NSLog(@"点击了取消");
        }];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            NSLog(@"点击了确定");
        }];
        [alertContrller2 addAction:cancelAction];
        [alertContrller2 addAction:okAction];
        [self presentViewController:alertContrller2 animated:YES completion:nil];
        }
    }
//上传按钮响应事件
-(void)Userimageclick{
    NSLog(@"修改头像");
    UIImagePickerController *imagePicker =  [[UIImagePickerController alloc]init];
    imagePicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    //使用图片代理-查看协议-并实现“didFinishPickingImage”事件
    imagePicker.delegate=self;
    //使用模态窗口显示相册
    [self  presentViewController:imagePicker animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    
    //设置新头像
    [self.UserImage setImage:image ];
    //模态方式退出图像选择器
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
