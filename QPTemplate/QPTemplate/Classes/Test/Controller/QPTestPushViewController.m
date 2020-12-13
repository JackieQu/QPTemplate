//
//  QPTestPushViewController.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/12.
//

#import "QPTestPushViewController.h"

@interface QPTestPushViewController ()

@end

@implementation QPTestPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self popVC];
}

@end
