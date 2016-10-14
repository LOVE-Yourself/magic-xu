//
//  XXDNewFeatureCollectionViewController.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/25.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "XXDNewFeatureCollectionViewController.h"
#import "XXDNewFeatureCollectionViewCell.h"
@interface XXDNewFeatureCollectionViewController ()
@property(nonatomic,weak)UIImageView *guide;
@property(nonatomic,assign)CGFloat lastOffsetX;

@end
#define XXDPage 4
@implementation XXDNewFeatureCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
-(instancetype)init {
    UICollectionViewFlowLayout *Layout = [[UICollectionViewFlowLayout alloc]init];
    Layout.minimumLineSpacing = 0;//行间距
    Layout.minimumInteritemSpacing = 0;//每个item之间的距离
    Layout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;//水平方向滑动
    Layout.itemSize = [UIScreen mainScreen].bounds.size;//每个cell的大小
    return [super initWithCollectionViewLayout:Layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.pagingEnabled = YES;//开启分页
    self.collectionView.bounces = NO;//取消弹簧效果
    self.collectionView.showsHorizontalScrollIndicator = NO;//取消水平方向滚动条
  //先在缓存池里注册一个标识为reuseIdentifier的cell
    [self.collectionView registerClass:[XXDNewFeatureCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
  //添加图片，添加到collectionView
    [self setUpChildImage];
}
-(void)setUpChildImage {
    //线
    UIImageView *imageLine = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];

    imageLine.x -= 150;
    [self.collectionView addSubview:imageLine];
    //球
    UIImageView *guide = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    self.guide = guide;
//    CGRect fram = guide.frame;
//    fram.origin.y += 50;
//    guide.frame = fram;
    guide.x += 50;
    [self.collectionView addSubview:guide];
    //大标题
    UIImageView *guideLargeText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    guideLargeText.center = CGPointMake(self.view.width*0.5, self.view.height*0.7);
    [self.collectionView addSubview:guideLargeText];
    //小标题
    UIImageView *guideSmallText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
       guideSmallText.center = CGPointMake(self.view.width*0.5, self.view.height*0.8);
    [self.collectionView addSubview:guideSmallText];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //这里Item就指的是cell
#warning Incomplete implementation, return the number of items
    return XXDPage;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XXDNewFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //    if(cell == nil) {
    //        cell = [[UICollectionViewCell alloc]init];
    //    }
    //想让cell一创建就可以显示图片，自定义cell
    NSString *imageN = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    UIImage *image = [UIImage imageNamed:imageN];
    cell.image = image;
    //拿到索引，判断是否是最后一个cell
    [cell setIndexPath:indexPath count:XXDPage];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //滑动减速时候调用
    //平移一个屏幕宽度
    CGFloat offsetX = scrollView.contentOffset.x;
    NSLog(@"%f",offsetX);
    CGFloat del = offsetX - self.lastOffsetX;//一个屏幕的宽度
    self.guide.x += del*2;
    [UIView animateWithDuration:0.2 animations:^{
        self.guide.x -= del;
    }];
    //计算页码
  NSInteger page = offsetX/del;//总的偏移量除以一个屏幕宽度的
    NSString *name = [NSString stringWithFormat:@"guide%ld",page + 1];
    self.guide.image = [UIImage imageNamed:name];
    
    NSLog(@"%ld",page);
    NSLog(@"%f",del);
    self.lastOffsetX = offsetX;
    
    
    
}
#pragma mark <UICollectionViewDelegate>

@end
