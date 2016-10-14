//
//  UIImage+XXDImage.h
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/21.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XXDImage)
//防止图片渲染
+(UIImage *)imagewithRenderName:(NSString *)name;
//拉伸图片
+(UIImage *)ImageWithstretchable:(NSString *)name;
@end
