//
//  UIView+XXDFrame.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/22.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "UIView+XXDFrame.h"

@implementation UIView (XXDFrame)
-(void)setWidth:(CGFloat)width {
      
}
-(CGFloat)width {
    return self.frame.size.width;
}
-(void)setHeight:(CGFloat)height {
    CGRect fram = self.frame;
    fram.size.height = height;
    self.frame = fram;
}
-(CGFloat)height {
    return self.frame.size.height;
}
-(void)setX:(CGFloat)x {
    CGRect fram = self.frame;
    fram.origin.x = x;
    self.frame = fram;
}
-(CGFloat)x {
    return self.frame.origin.x;
}
-(void)setY:(CGFloat)y {
    CGRect fram = self.frame;
    fram.origin.y = y;
    self.frame = fram;
}
-(CGFloat)y {
    return self.frame.origin.y;
}
@end
