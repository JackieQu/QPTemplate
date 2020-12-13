//
//  QPHomeCellFrame.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPBaseModel.h"
#import "QPArticleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QPHomeCellFrame : QPBaseModel

@property (nonatomic, assign) CGRect headImgViewFrame;
@property (nonatomic, assign) CGRect nameLabelFrame;
@property (nonatomic, assign) CGRect titleLabelFrame;
@property (nonatomic, assign) CGRect contentImgViewFrame;
@property (nonatomic, assign) CGRect toolListViewFrame;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) QPArticleModel *article;

@end

NS_ASSUME_NONNULL_END
