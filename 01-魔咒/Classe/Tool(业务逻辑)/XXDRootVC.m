//
//  XXDRootVC.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/26.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "XXDRootVC.h"
#import "XXDTabBarController.h"
#import "XXDNewFeatureCollectionViewController.h"
#import "XXDSaveTool.h"
#import "XXDRootVC.h"
#define Version @"version"
@implementation XXDRootVC
+(UIViewController *)choseRootVC {
    //取出当前版本号
    //在系统的info.plist文件中
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
    NSString *curVersion = dict[@"CFBundleShortVersionString"];
    
    //偏好设置存储版本号
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //读出原有版本号
    NSString *lastVersion = [XXDSaveTool objectForKey:Version];
    UIViewController *rootVC;
    //偏好设置存储的版本号，是否等于当前版本号
        if([lastVersion isEqualToString:curVersion]) {
            //如果等于进入主框架
            UITabBarController *vc = [[XXDTabBarController alloc]init];
            rootVC = vc;

        }else {
    //进入新特性界面
    //1、第一次进入应用
    //2、版本号更新
            rootVC = [[XXDNewFeatureCollectionViewController alloc]init];
    //将当前的版本号存在偏好设置,以便在进入应用时进行比对
    [XXDSaveTool setObject:curVersion forKey:Version];
     
        }
    return rootVC;
    
}
@end
