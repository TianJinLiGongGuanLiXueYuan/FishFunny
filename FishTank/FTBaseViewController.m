//
//  FTBaseViewController.m
//  FishTank
//
//  Created by 天津财经大学信科二 on 16/7/13.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import "FTBaseViewController.h"

@interface FTBaseViewController ()

@end

@implementation FTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}



@end
