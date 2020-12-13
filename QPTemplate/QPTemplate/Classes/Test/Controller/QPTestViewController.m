//
//  QPTestViewController.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/12.
//

#import "QPTestViewController.h"
#import "QPTestPushViewController.h"
#import "QPTestPresentViewController.h"

@interface QPTestViewController ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation QPTestViewController

- (UIView *)testView {
    
    if (!_testView) {
        _testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _testView.center = CGPointMake(SCREEN_WIDTH / 2, CONTENT_HEIGHT / 2);
        _testView.backgroundColor = [UIColor randomColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [_testView addGestureRecognizer:tap];
    }
    return _testView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testView];
}

- (void)tapAction {

    NSInteger flag = arc4random() % 2;
    if (flag == 0) {
        
        QPTestPushViewController *vc = [[QPTestPushViewController alloc] init];
        [self pushVC:vc];
        
    } else {
        
        QPTestPresentViewController *vc = [[QPTestPresentViewController alloc] init];
        [self presentVC:vc];
    }
}

@end
