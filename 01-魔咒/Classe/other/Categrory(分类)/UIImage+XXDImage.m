//
//  UIImage+XXDImage.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/21.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "UIImage+XXDImage.h"

@implementation UIImage (XXDImage)
//防止渲染
+(UIImage *)imagewithRenderName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}
//拉伸图片
+(UIImage *)ImageWithstretchable:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
