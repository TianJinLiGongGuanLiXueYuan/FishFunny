//
//  FTUserInfoViewController.h
//  FishTank
//
//  Created by Student05 on 16/7/15.
//  Copyright © 2016年 pikaqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PassValueDelegate <NSObject>

@optional

- (void)passValue:(NSString *)value;

@end
@interface FTUserInfoViewController : UIViewController

@end
