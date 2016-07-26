//
//  ChineseSorting.h
//  SearchForChinese
//
//  Created by Dong on 15/5/14.
//  Copyright (c) 2015年 xindong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pinyin.h"
@interface ChineseSorting : NSObject
/***
 *
 汉字首字母排序 -- 参数为存放汉字的数组
 *
 **/
- (NSArray *)firstCharcterSortingOfChinese:(NSMutableArray *)array;

/*
 *
 **汉字排序方法 -- 第一个参数为存放汉字的数组 ,第二个参数为汉字拼音首字母的数组(通过调用上面的方法获取)
         
 ******** 返回的字典 key 为keyArray里的参数(即排好顺序的拼音首字母)
*/
- (NSMutableDictionary *)chineseCharacterSorting:(NSMutableArray *)array KeyArray:(NSArray *)keyArray;

+ (ChineseSorting *)sharedInstance;
@end
