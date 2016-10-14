//
//  XXDSaveTool.h
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/26.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import <Foundation/Foundation.h>
//自己定义的存储工具类便于以后更改存储方式
@interface XXDSaveTool : NSObject
+(nullable id)objectForKey:(NSString *)defaultName;
+(void)setObject:(nullable id)value forKey:(NSString *)defaultName;

@end
