//
//  LimitInput.h
//  LimitInput
//
//  Created by xsw on 16/6/2.
//  Copyright © 2016年 XuShiWu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#define PROPERTY_NAME @"LimitInput"

#define DECLARE_PROPERTY(className) \
@interface className (Limit) @end

DECLARE_PROPERTY(UITextField)
DECLARE_PROPERTY(UITextView)

@interface LimitInput : NSObject

@property(nonatomic, assign) BOOL enableLimitCount;

+(LimitInput *) sharedInstance;


@end
