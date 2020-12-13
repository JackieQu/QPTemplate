//
//  QPHomeRecommendViewController.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPHomeRecommendViewController.h"
#import "QPHomeTableViewCell.h"
#import "QPHomeCellFrame.h"

static NSString *identifier = @"cellID";

@interface QPHomeRecommendViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, assign) NSInteger page;

@end

@implementation QPHomeRecommendViewController

- (UITableView *)tableView {
    
    if (!_tableView) {
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, CONTENT_HEIGHT);
        _tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.backgroundColor = kWhiteColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        [_tableView registerClass:[QPHomeTableViewCell class] forCellReuseIdentifier:identifier];
    }
    return _tableView;
}

- (NSMutableArray *)dataArr {
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadData {
 
    self.page = 1;
    [self testLoadData];
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self.tableView.mj_footer resetNoMoreData];
    [self.tableView.mj_header endRefreshing];
}

- (void)loadMoreData {
    
    self.page += 1;
    [self testLoadData];
    [self.tableView reloadData];
    [self.tableView.mj_footer endRefreshing];
}

- (void)testLoadData {
    
    if (self.page == 1) {
        [self.dataArr removeAllObjects];
    }
    
    NSDictionary *dict = @{
        @"headURL": @"https://www2.bing.com/th?id=OHR.PineGrosbeak_ZH-CN9629000282_UHD.jpg&rf=LaDigue_UHD.jpg&pid=hp&w=1920&h=1080&rs=1&c=4",
        @"name": @"哎呀我Qu",
        @"title": @"这是一个标题",
        @"imageURL": @"https://www2.bing.com/th?id=OHR.PineGrosbeak_ZH-CN9629000282_UHD.jpg&rf=LaDigue_UHD.jpg&pid=hp&w=1920&h=1080&rs=1&c=4",
    };
    NSInteger pageSize = 10;
    for (NSInteger i = 0; i < pageSize; i ++) {
        QPArticleModel *article = [QPArticleModel modelWithDict:dict];
        NSInteger num = (self.page - 1) * pageSize + i + 1;
        article.name = [article.name stringByAppendingFormat:@"-%ld", (long)num];
        article.title = [article.title stringByAppendingFormat:@"-%ld", (long)num];
        QPHomeCellFrame *cellFrame = [[QPHomeCellFrame alloc] init];
        cellFrame.article = article;
        [self.dataArr addObject:cellFrame];
    }
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QPHomeCellFrame *cellFrame = self.dataArr[indexPath.row];
    
    QPHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[QPHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.cellFrame = cellFrame;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    QPHomeCellFrame *cellFrame = self.dataArr[indexPath.row];
    QPArticleModel *article = cellFrame.article;
    QPLog(@"%@", article);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QPHomeCellFrame *cellFrame = self.dataArr[indexPath.row];
    return cellFrame.cellHeight;
}

@end
