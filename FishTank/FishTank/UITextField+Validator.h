//
//  UITextField+Validator.h
//  1⃣️BW iNote
//
//  Created by tjufe on 16/1/26.
//  Copyright © 2016年 tjufe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Validator)

-(BOOL)isNotEmpty;

-(BOOL)validateUserName;

-(BOOL)validateEmail;

-(BOOL)validatePassWord;

@end
