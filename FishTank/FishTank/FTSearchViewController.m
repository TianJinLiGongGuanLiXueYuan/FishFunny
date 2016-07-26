//
//  FTSearchViewController.m
//  FishTank
//
//  Created by zhengning on 16/7/16.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTSearchViewController.h"
#import "ChineseSorting.h"
#import "FTMainViewController.h"
#import "FTFishDataViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface FTSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating>
@property (nonatomic , strong)UIViewController *fishdataVC;
@property (nonatomic , strong)UILabel *fishlabel;
@property (nonatomic , strong)UIButton *setBtn;
@end

@implementation FTSearchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor =UIColorFromRGB(0xede9e9);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // UISearchController初始化
    self.searchVC = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchVC.searchResultsUpdater = self;
    self.searchVC.delegate = self;
    self.searchVC.searchBar.frame = CGRectMake(0, 100, WIDTH, 44);
    self.searchVC.searchBar.barTintColor = [UIColor yellowColor];
    self.tableView.tableHeaderView = self.searchVC.searchBar;
    
    // 设置为NO,可以点击搜索出来的内容
    self.searchVC.dimsBackgroundDuringPresentation = NO;
    
    // 原始数据
    self.dataArray = [NSMutableArray arrayWithObjects:@"金鱼",@"锦鲤",@"玛丽鱼",@"热带鱼",@"Yu",nil];
    
   [self customSortingOfChinese:self.dataArray];
}
- (void)customSortingOfChinese:(NSMutableArray *)array
{
    // 获取汉字拼音首字母
    self.keyArray = [[ChineseSorting sharedInstance] firstCharcterSortingOfChinese:array];
    
    // 将汉字排序
    self.sectionDictionary = [NSMutableDictionary dictionary];
    self.sectionDictionary = [[ChineseSorting sharedInstance] chineseCharacterSorting:array KeyArray:self.keyArray];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.keyArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取每个section对应的数组
    NSArray *arr = [self.sectionDictionary objectForKey:self.keyArray[section]];
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    NSArray *arr = [self.sectionDictionary objectForKey:self.keyArray[indexPath.section]];
    cell.textLabel.text = arr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
// section的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.keyArray[section];
}
-(void)didDismissSearchController:(UISearchController *)searchController
{
    //[self customSortingOfChinese:self.dataArray];
    [self.tableView reloadData];
}
#pragma mark -- 点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.tableView.tableHeaderView = nil;
    FTFishDataViewController *fishdataVC =[[FTFishDataViewController alloc]init];
    [self.navigationController pushViewController:fishdataVC animated:YES];
    

//    _fishdataVC = [[UIViewController alloc]init];
//    if (indexPath.section==0) {
//        _fishlabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
//        _fishlabel.text = @"温度：27℃   PH值6.5   含氧量8mg/L";
//        _setBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-40, HEIGHT-40, 40, 40)];
//        _setBtn.titleLabel.text = @"确定";
//        _setBtn.backgroundColor = [UIColor orangeColor];
//        [_setBtn addTarget:self action:@selector(setBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        _setBtn.backgroundColor = [UIColor whiteColor];
//    
//    }
//    [self.navigationController pushViewController:_fishdataVC animated:YES];
//    [_fishdataVC.view addSubview:_setBtn];
//    [_fishdataVC.view addSubview:_fishlabel];
//    _searchVC.hidesNavigationBarDuringPresentation=YES;
}
-(void)setBtnClick
{
     FTMainViewController *mainVC = [[FTMainViewController alloc]init];
    [self.navigationController pushViewController:mainVC animated:YES];
}
#pragma mark -- 搜索方法
// 搜索时触发的方法
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchStr = [self.searchVC.searchBar text];
    // 谓词
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", searchStr];
    
    // 过滤数据
    NSMutableArray *resultDataArray = [NSMutableArray arrayWithArray:[self.dataArray filteredArrayUsingPredicate:predicate]];
    
    // 调用排序方法
    [self customSortingOfChinese:resultDataArray];
    
    // 刷新列表
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
