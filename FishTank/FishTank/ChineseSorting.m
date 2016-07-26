//
//  ChineseSorting.m
//  SearchForChinese
//
//  Created by Dong on 15/5/14.
//  Copyright (c) 2015年 xindong. All rights reserved.
//

#import "ChineseSorting.h"

@implementation ChineseSorting

+(ChineseSorting *)sharedInstance
{
    static ChineseSorting *chinesesort = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        chinesesort = [[ChineseSorting alloc] init];
    });
    return chinesesort;
}
/*
 * 将汉字拼音首字母进行排序
 */
-(NSArray *)firstCharcterSortingOfChinese:(NSMutableArray *)array
{
    NSMutableSet *firstArr = [[NSMutableSet alloc] init];
    for (int i = 0; i < array.count; i++) {
        char cc = pinyinFirstLetter([array[i] characterAtIndex:0]);
        NSString *str = [[NSString stringWithFormat:@"%c", cc] uppercaseString];
        [firstArr addObject:str];
        
    }
    NSArray *newArray = [[firstArr allObjects] sortedArrayUsingSelector:@selector(compare:)];
    return newArray;
}

/*
 * 汉字按照拼音首字母排序存入字典中
 */
-(NSMutableDictionary *)chineseCharacterSorting:(NSMutableArray *)array KeyArray:(NSArray *)keyArray
{
    NSMutableDictionary *sectionDic = [NSMutableDictionary dictionary];
    for (int i = 0; i < keyArray.count; i++) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int j = 0; j < array.count; j++) {
            char cc = pinyinFirstLetter([array[j] characterAtIndex:0]);
            NSString *first = [[NSString stringWithFormat:@"%c", cc] uppercaseString];
            if ([first isEqualToString:keyArray[i]]) {
                [arr addObject:array[j]];
            }
        }
        [sectionDic setObject:arr forKey:keyArray[i]];
    }
    return sectionDic;

}






@end
