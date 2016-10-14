//
//  XXDNewFeatureCollectionViewCell.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/25.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "XXDNewFeatureCollectionViewCell.h"
#import "XXDTabBarController.h"
@interface XXDNewFeatureCollectionViewCell ()
@property(nonatomic,weak)UIImageView *imageV;
@property(nonatomic,weak)UIButton *btn;
@end
@implementation XXDNewFeatureCollectionViewCell
-(UIButton *)btn {
    if(_btn == nil) {
        UIButton *btn = [[UIButton alloc]init];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.center = CGPointMake(self.contentView.frame.size.width*0.5, self.contentView.frame.size.height*0.9);
        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        _btn = btn;
        [self.contentView addSubview:btn];
    }
    return _btn;
}
//切换窗口的主控制器
-(void)click {
    XXDTabBarController *tabarVC = [[XXDTabBarController alloc]init];
    
   [UIApplication sharedApplication].keyWindow.rootViewController = tabarVC;
}
-(UIImageView *)imageV {
    if(_imageV == nil) {
       UIImageView *imageV = [[UIImageView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:imageV];
        _imageV = imageV;
    }
    return _imageV;
}
-(void)setImage:(UIImage *)image {
    _image = image;
    self.imageV.image = image;
}
-(void) setIndexPath:(NSIndexPath *)indexpath count:(CGFloat)count {
    if(indexpath.item == count - 1) {
        self.btn.hidden = NO;
    }else {
        self.btn.hidden = YES;
    }
    
}
@end
