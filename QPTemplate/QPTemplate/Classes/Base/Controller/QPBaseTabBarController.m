//
//  QPBaseTabBarController.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/12.
//

#import "QPBaseTabBarController.h"
#import "QPBaseViewController.h"
#import "QPBaseNavController.h"

@interface QPBaseTabBarController ()

@end

@implementation QPBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *vcNames = [NSMutableArray arrayWithArray:@[
        @"QPTestViewController",
        @"QPHomeViewController",
        @"QPLiveViewController",
        @"QPVideoViewController",
        @"QPProfileViewController",
    ]];
    NSArray *titles = @[@"测试", @"首页", @"直播", @"视频", @"我的"];
    for (NSInteger i = 0; i < vcNames.count; i ++) {
        QPBaseViewController *vc = [[[NSClassFromString(vcNames[i]) class] alloc] init];
        vc.title = titles[i];
        QPBaseNavController *navVC = [[QPBaseNavController alloc] initWithRootViewController:vc];
        [vcNames replaceObjectAtIndex:i withObject:navVC];
    }
    self.viewControllers = vcNames;
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
