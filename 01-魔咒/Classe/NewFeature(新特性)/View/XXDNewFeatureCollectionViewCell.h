//
//  XXDNewFeatureCollectionViewCell.h
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/25.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXDNewFeatureCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImage *image;
-(void) setIndexPath:(NSIndexPath *)indexpath count:(CGFloat)count;
@end
