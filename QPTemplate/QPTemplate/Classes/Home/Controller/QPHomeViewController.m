//
//  QPHomeViewController.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/12.
//

#import "QPHomeViewController.h"
#import "QPHomeTitleListView.h"
#import "QPHomeColumnModel.h"

@interface QPHomeViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) QPHomeTitleListView *titleListView;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation QPHomeViewController

- (QPHomeTitleListView *)titleListView {
    
    if (!_titleListView) {
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCALE(40));
        _titleListView = [[QPHomeTitleListView alloc] initWithFrame:frame];
        __weak typeof(self) weakSelf = self;
        _titleListView.selectBlock = ^(NSInteger index) {
            __strong typeof(self) strongSelf = weakSelf;
            CGPoint point = CGPointMake(SCREEN_WIDTH * index, strongSelf.scrollView.contentOffset.y);
            [strongSelf.scrollView setContentOffset:point animated:YES];
        };
    }
    return _titleListView;
}

- (UIScrollView *)scrollView {
    
    if (!_scrollView) {
        CGRect frame = CGRectMake(0, self.titleListView.bottom, SCREEN_WIDTH, CONTENT_HEIGHT - self.titleListView.height);
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.backgroundColor = kWhiteColor;
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    QPHomeColumnModel *homeColumnModel = [QPHomeColumnModel homeColumnModel];
    NSMutableArray *titles = [NSMutableArray array];
    NSMutableArray *columnArr = homeColumnModel.availableColumnArr;
    for (NSInteger i = 0; i < columnArr.count; i ++) {
        QPColumnItemModel *columnModel = columnArr[i];
        QPBaseViewController *vc = [[columnModel.cls alloc] init];
        [self addChildViewController:vc];
        vc.title = columnModel.vcTitle;
        [titles addObject:vc.title];
    }
    self.titleListView.titles = titles;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * columnArr.count, 0);
    self.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * homeColumnModel.defaultIndex, 0);
    [self addChildViewToScrollView:self.scrollView];
}

- (void)initUI {

    [self.view addSubview:self.titleListView];
    [self.view addSubview:self.scrollView];
}

- (void)addChildViewToScrollView:(UIScrollView *)scrollView {
    
    CGFloat width  = scrollView.width;
    CGFloat height = scrollView.height;
    CGFloat offset = scrollView.contentOffset.x;
    NSInteger idx  = offset / width;
    [self.titleListView scrollToIndex:idx];
    QPBaseViewController *vc = self.childViewControllers[idx];
    if (vc.viewLoaded) {
        return;
    }
    vc.view.frame = CGRectMake(offset, 0, width, height);
    [scrollView addSubview:vc.view];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self addChildViewToScrollView:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    [self addChildViewToScrollView:scrollView];
}

@end
