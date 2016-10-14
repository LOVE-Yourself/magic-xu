//
//  XXDtabBar.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/21.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "XXDtabBar.h"
#import "XXDbtn.h"
@interface XXDtabBar()
@property(nonatomic,strong)XXDbtn *btn;
@end
@implementation XXDtabBar
-(void)setItems:(NSArray *)items {
    _items = items;
    for(UITabBarItem *item in items) {
        XXDbtn *btn = [XXDbtn buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        //点击按钮显示选中状态
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
    }
}
-(void)click:(XXDbtn *)btn {
    self.btn.selected = NO;
    btn.selected =YES;
    self.btn = btn;
    if([self.delegate respondsToSelector:@selector(XXDtabar:index:)]) {
        [self.delegate XXDtabar:self index:btn.tag];
    }
}
//布局子控件
-(void)layoutSubviews {
    [super layoutSubviews];
    int i = 0;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.bounds.size.width/self.items.count;
    CGFloat btnH = self.bounds.size.height;
    for(XXDbtn *btn in self.subviews) {
        btnX = i*btnW;
        btn.tag = i;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        i++;
    }


    
}
@end
