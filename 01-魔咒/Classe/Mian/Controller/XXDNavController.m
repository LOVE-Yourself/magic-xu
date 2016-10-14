//
//  XXDNavController.m
//  01-彩票项目分析
//
//  Created by 哥不帅但很坏 on 16/8/21.
//  Copyright © 2016年 哥不帅但很坏. All rights reserved.
//

#import "XXDNavController.h"

@interface XXDNavController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong)id PopGesture;
@end

@implementation XXDNavController
+(void)initialize {
    //防止子类重复调用
    if(self == [XXDNavController class]){
        
//    UINavigationBar *bar = [UINavigationBar appearance];//统一定制导航条(程序里的所有导航控制器)重大Bug，管的太宽了
    NSArray *array =@[self];
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:array];
    //设置导航条的背景图片 只能用默认模式[UIImage imageNamed:@"toolbar_background"]
//     UIImage *image= [UIImage imageNamed:@"RedButton"];
//    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
        [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
        dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [bar setTitleTextAttributes:dict];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加自己为自己的代理(导航控制器自己监听自己)
    self.delegate = self;
    //全屏滑动pop
    self.PopGesture = self.interactivePopGestureRecognizer.delegate;//系统给导航控器添加的手势的代理
    self.interactivePopGestureRecognizer.enabled = NO;//将系统给导航控制器添加的手势禁用
    NSLog(@"%@",self.interactivePopGestureRecognizer);//打印一下这个手势，看里面谁监听，调用了什么方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.PopGesture action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
    
}
//手势开始之前调用
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    //进行判断，如果是根控制器，将pan手势禁用
    BOOL open = self.viewControllers.count > 1;//大于1时，非根控制器，开启手势
    return open;
}
//导航控制器显示完成时调用
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //判断是根控制器还原代理
    if(self.viewControllers[0] == viewController) {
        self.interactivePopGestureRecognizer.delegate = self.PopGesture;
    }else {
        //清除导航控制器手势的代理
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    //一开始会调用5次，将根控制器入栈
    //判断除了根控制器，其他的leftBarButtonItem统一
    if(self.childViewControllers.count >1) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imagewithRenderName:@"NavBack"] style:0 target:self action:@selector(back)];
    }
    
}
-(void)back {
    [self popToRootViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
