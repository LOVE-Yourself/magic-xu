//
//  XXDTabBarController.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/20.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "XXDTabBarController.h"


#import "XXDCommunityViewController.h"
#import "XXDChatViewController.h"
#import "XXDNavController.h"
#import "XXDtabBar.h"


@interface XXDTabBarController ()<XXDtabBarDelegate>
@property(nonatomic,strong)NSMutableArray *arrayItem;
@end

@implementation XXDTabBarController
-(NSMutableArray *)arrayItem {
    if(_arrayItem == nil) {
        _arrayItem = [NSMutableArray array];
    }
    return _arrayItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self setupAllChildViewContoller];
//    [self.tabBar removeFromSuperview];//将原来的tabBar移除
   [self setupTabBar];//添加一个新的taBar
}
-(void)setupAllChildViewContoller {
   //1、社区
    XXDCommunityViewController *Arena1 = [[XXDCommunityViewController alloc]init];
    [self addChildViewController:Arena1];
    [self setupOneChildViewContoller:Arena1 image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:@"社区"];
    
    //2、聊天
    XXDChatViewController *ChatVC = [[XXDChatViewController alloc]init];
    [self addChildViewController:ChatVC];
     [self setupOneChildViewContoller:ChatVC image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:@"聊天"];
    //3、设备控制
    XXDCommunityViewController *Arena3 = [[XXDCommunityViewController alloc]init];
    [self addChildViewController:Arena3];
    [self setupOneChildViewContoller:Arena3 image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:nil];
    //4、商店
    XXDCommunityViewController *Arena4 = [[XXDCommunityViewController alloc]init];
    [self addChildViewController:Arena4];
    [self setupOneChildViewContoller:Arena4 image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:nil];
    //5、我的
    XXDCommunityViewController *Arena5 = [[XXDCommunityViewController alloc]init];
    [self addChildViewController:Arena5];
    [self setupOneChildViewContoller:Arena5 image:[UIImage imageNamed:@"TabBar_Arena_new"] selectImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]title:nil];
}
-(void)setupTabBar {
    XXDtabBar *newTabar = [[XXDtabBar alloc]init];
    newTabar.items = self.arrayItem;
    newTabar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:newTabar];
    newTabar.delegate = self;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //想删除tabar里的子控件，结果子控件是私有的拿不到，用逆向思维
    for(UIView *view in self.tabBar.subviews) {
        if(![view isKindOfClass:[XXDtabBar class]])
            [view removeFromSuperview];
    }
}
-(void)XXDtabar:(XXDtabBar *)tabar index:(NSInteger)index {
    self.selectedIndex = index;//切换子控制器
    
}
//添加一个控制器(抽取出来的方法)
-(void)setupOneChildViewContoller:(UIViewController *)vc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title{
    UINavigationController *nav = [[XXDNavController alloc]initWithRootViewController:vc];
 
    vc.navigationItem.title = title;//栈顶控制器的navigationItem决定导航栏上的显示
 
    //自己的事情自己做，设置导航条在自己的导航控制器里设置
//    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"toolbar_background"] forBarMetrics:UIBarMetricsDefault];//设置导航条的背景图片 只能用默认模式
//    
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
//    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    [nav.navigationBar setTitleTextAttributes:dict];
    
    [self addChildViewController:nav];
    
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    [self.arrayItem addObject:vc.tabBarItem];//将tabBarItem模型加入数组
    NSLog(@"%ld",self.arrayItem.count);

}


@end
