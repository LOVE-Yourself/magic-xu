//
//  XXDSaveTool.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/26.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "XXDSaveTool.h"

@implementation XXDSaveTool
+(nullable id)objectForKey:(NSString *)defaultName {
    //偏好设置存储版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     return [defaults objectForKey:defaultName];
}
+(void)setObject:(nullable id)value forKey:(NSString *)defaultName {
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:defaultName];
    [defaults synchronize];
}
@end
