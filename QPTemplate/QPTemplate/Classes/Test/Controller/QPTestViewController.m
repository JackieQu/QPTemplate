//
//  QPTestViewController.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/12.
//

#import "QPTestViewController.h"
#import "QPTestPushViewController.h"
#import "QPTestPresentViewController.h"

#import "QPTestHandler.h"
#import "QPTestURLModel.h"
#import "QPTestPublicKeyModel.h"
#import "QPEncryptHelper.h"
#import <SVProgressHUD.h>
#import <MBProgressHUD.h>

@interface QPTestViewController ()

@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UIButton *testBtn;

@end

@implementation QPTestViewController

- (UIButton *)testBtn {
    
    if (!_testBtn) {
        _testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _testBtn.frame = CGRectMake(0, 0, SCALE(100), SCALE(40));
        _testBtn.center = CGPointMake(SCREEN_WIDTH / 2, CONTENT_HEIGHT / 2);
        _testBtn.backgroundColor = kMainColor;
        [_testBtn setTitle:@"TEST" forState:UIControlStateNormal];
        [_testBtn setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_testBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testBtn;
}

- (void)loadView {
    [super loadView];
    
//    UIImageView * imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    imageView.image = [UIImage imageNamed:@"view_bg_img"];
//    imageView.userInteractionEnabled = YES;
//    self.view = imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImage *img = [[UIImage imageNamed:@"nav_bg_img"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
//    [self.navigationController.navigationBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    self.view.backgroundColor = kRandomColor;
    [self.view addSubview:self.testBtn];
}

#pragma mark - Custom Methods

- (void)clickAction:(UIButton *)button {
    
    [self getURL];
    return;

    NSInteger flag = arc4random() % 2;
    if (flag == 0) {
        QPTestPushViewController *vc = [[QPTestPushViewController alloc] init];
        [self pushVC:vc];
    } else {
        QPTestPresentViewController *vc = [[QPTestPresentViewController alloc] init];
        [self presentVC:vc];
    }
}

- (void)getURL {
    
    [QPTestHandler handleGetURLRequestWithSuccess:^(id  _Nonnull obj) {
        QPTestURLModel *urlModel = [QPTestURLModel unarchive];
        QPURLResultModel *resultModel = urlModel.results;
        QPLog(@"\n%@\n%@\n%@", resultModel.server_url_cb, resultModel.server_url_xy, resultModel.edition);
    } failure:^(id  _Nonnull obj) {
        QPLog(@"%@", obj);
    }];
}

- (void)getPublicKey {
    
    [QPTestHandler handleGetPublicKeyRequestWithSuccess:^(id  _Nonnull obj) {
        QPPublicKeyDataModel *pubKeyDataModel = obj;
        SecKeyRef pubKeyRef = [QPEncryptHelper getPublicKeyRefWithExponentStr:pubKeyDataModel.exponent
                                                                   modulusStr:pubKeyDataModel.modulus];
        QPLog(@"\n%@\n%@\n%@", pubKeyDataModel.exponent, pubKeyDataModel.modulus, pubKeyRef);
    } failure:^(id  _Nonnull obj) {
        QPLog(@"%@", obj);
    }];
}

@end
