//
//  FTMyFishBallViewController.m
//  FishTank
//
//  Created by Student03 on 16/7/14.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTMyFishBallViewController.h"
#import "FTScanLoginViewController.h"

@interface FTMyFishBallViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *FishTankTableView;
/** 底部删除按钮 */
@property (nonatomic ,strong)UIButton *deleteButton;
@property (nonatomic,strong)UIButton *addFishTankBtn;
/** 数据源 */
@property (nonatomic ,copy)NSMutableArray *FishTankArrs;
/** 标记是否全选 */
@property (nonatomic ,assign)BOOL isAllSelected;
@end

@implementation FTMyFishBallViewController

-(NSMutableArray *)FishTankArrs
{
    
    if (!_FishTankArrs) {
        _FishTankArrs = [NSMutableArray arrayWithArray:@[@"金鱼",@"白玉凤凰",@"刀鱼",@"古巴三色鱼"]];
    }
    return _FishTankArrs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的鱼缸";
    self.FishTankTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 10*Xwidth, 4*Yheight)];
    self.FishTankTableView.delegate = self;
    self.FishTankTableView.dataSource = self;
    self.FishTankTableView.tableFooterView = [[UIView alloc] init];
    self.FishTankTableView.backgroundColor = UIColorFromRGB(0xede9e9);
    self.FishTankTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.FishTankTableView];
    
    /*=========================至关重要============================*/
    self.FishTankTableView.allowsMultipleSelectionDuringEditing = YES;
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
    /** 底部删除按钮 */
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteButton = deleteButton;
    [self.view addSubview:deleteButton];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deleteButton setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.7f]];
    [deleteButton setFrame:CGRectMake(0, UIScreenHeight, UIScreenWidth, 60)];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [deleteButton addTarget:self action:@selector(deleteArr) forControlEvents:UIControlEventTouchUpInside];
    //添加鱼缸按钮
    UIButton *addFishTankBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addFishTankBtn = addFishTankBtn;
    [self.view addSubview:addFishTankBtn];
    [addFishTankBtn setTitle:@"添加鱼缸" forState:UIControlStateNormal];
    [addFishTankBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addFishTankBtn setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.7f]];
    [addFishTankBtn setFrame:CGRectMake(0, UIScreenHeight, UIScreenWidth, 60)];
    addFishTankBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [addFishTankBtn addTarget:self action:@selector(addFishTankClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 跳转登陆
-(void)addFishTankClick{
    FTScanLoginViewController *ScanloginVC=[[FTScanLoginViewController alloc]init];
    [self.navigationController pushViewController:ScanloginVC animated:YES];
}

-(void)edit
{
    /** 每次点击 rightBarButtonItem 都要取消全选 */
    self.isAllSelected = NO;
    
    NSString *string = !self.FishTankTableView.editing?@"取消":@"编辑";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:string style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
    
    
    if (self.FishTankArrs.count) {
        self.navigationItem.leftBarButtonItem = !self.FishTankTableView.editing? [[UIBarButtonItem alloc]initWithTitle:@"全选" style:UIBarButtonItemStyleDone target:self action:@selector(selectAll)]:nil;
        CGFloat height = !self.FishTankTableView.editing?60:0;
        CGFloat height2 = !self.FishTankTableView.editing?130:0;
        [UIView animateWithDuration:0.25 animations:^{
            self.deleteButton.frame = CGRectMake(0, UIScreenHeight - height, UIScreenWidth, 60);
            self.addFishTankBtn.frame=CGRectMake(0, UIScreenHeight - height2, UIScreenWidth, 60);
        }];
    }else{
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = nil;
        
        [UIView animateWithDuration:0.25 animations:^{
            self.deleteButton.frame = CGRectMake(0, UIScreenHeight, UIScreenWidth, 60);

        }];
    }
    
    self.FishTankTableView.editing = !self.FishTankTableView.editing;
    
}
#pragma mark - 多选删除

-(void)deleteArr
{
    
    NSMutableArray *deleteArrarys = [NSMutableArray array];
    for (NSIndexPath *indexPath in self.FishTankTableView.indexPathsForSelectedRows) {
        [deleteArrarys addObject:self.FishTankArrs[indexPath.row]];
    }
    
    
    
    [UIView animateWithDuration:0 animations:^{
        [self.FishTankArrs removeObjectsInArray:deleteArrarys];
        [self.FishTankTableView reloadData];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            
            if (!self.FishTankArrs.count) {
                self.navigationItem.leftBarButtonItem = nil;
                self.navigationItem.rightBarButtonItem = nil;
                self.deleteButton.frame = CGRectMake(0, UIScreenHeight, UIScreenWidth, 60);
                self.addFishTankBtn.frame=CGRectMake(0, UIScreenHeight-60, UIScreenWidth, 60);
            }
            
        } completion:^(BOOL finished) {
            /** 考虑到全选之后 ，反选几个 再删除  需要将全选置为NO, */
            self.isAllSelected = NO;
            
        }];
    }];
    
    
}

#pragma mark - 全选删除
-(void)selectAll
{
    
    self.isAllSelected = !self.isAllSelected;
    
    for (int i = 0; i<self.FishTankArrs.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        
        if (self.isAllSelected) {
            [self.FishTankTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }else{//反选
            
            [self.FishTankTableView deselectRowAtIndexPath:indexPath animated:YES];
            
        }
    }
}


#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.FishTankArrs.count;
    
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifi = @"FishTankCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifi];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifi];
    }
    
    /**
     *  单元格的选中类型一定不能设置为 UITableViewCellSelectionStyleNone，如果加上这一句，全选勾选不出来
     */
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.textLabel.text = self.FishTankArrs[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}
#pragma mark - cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark - 左滑删除
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.FishTankArrs removeObjectAtIndex:indexPath.row];
        [self.FishTankTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50.0f;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleDelete;
    
}
@end
