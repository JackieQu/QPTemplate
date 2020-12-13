//
//  QPBaseNavController.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/12.
//

#import "QPBaseNavController.h"

@interface QPBaseNavController ()

@end

@implementation QPBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.translucent = NO;
    navBar.tintColor = [UIColor whiteColor];
    navBar.barTintColor = [UIColor orangeColor];
    [navBar setTitleTextAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:20],
        NSForegroundColorAttributeName: [UIColor whiteColor],
//        NSBackgroundColorAttributeName: [UIColor redColor]
    }];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
