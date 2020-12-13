//
//  QPHomeCellFrame.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPHomeCellFrame.h"

@implementation QPHomeCellFrame

- (void)setArticle:(QPArticleModel *)article {
    _article = article;
    
    CGFloat kMaring = SCALE(MARGIN / 2);

    _headImgViewFrame = CGRectMake(kMaring, kMaring, SCALE(40), SCALE(40));
    
    CGFloat nameLabelX = CGRectGetMaxX(_headImgViewFrame) + kMaring;
    CGFloat nameLabelY = CGRectGetMinY(_headImgViewFrame);
    _nameLabelFrame = CGRectMake(nameLabelX, nameLabelY, SCALE(100), SCALE(30));
    
    CGFloat titleLabelX = CGRectGetMinX(_headImgViewFrame);
    CGFloat titleLabelY = CGRectGetMaxY(_headImgViewFrame) + kMaring;
    _titleLabelFrame = CGRectMake(titleLabelX, titleLabelY, SCREEN_WIDTH - kMaring * 2, SCALE(30));
    
    CGFloat contentImgViewY = CGRectGetMaxY(_titleLabelFrame) + kMaring;
    CGFloat contentImgViewH = SCREEN_WIDTH * 9 / 16;
    _contentImgViewFrame = CGRectMake(0, contentImgViewY, SCREEN_WIDTH, contentImgViewH);
    
    CGFloat toolListViewY = CGRectGetMaxY(_contentImgViewFrame);
    _toolListViewFrame = CGRectMake(0, toolListViewY, SCREEN_WIDTH, SCALE(40));
    
    _cellHeight = CGRectGetMaxY(_toolListViewFrame);
}

@end
