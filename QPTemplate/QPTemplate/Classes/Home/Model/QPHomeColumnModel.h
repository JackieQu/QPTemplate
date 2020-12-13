//
//  QPHomeColumnModel.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/14.
//

@class QPColumnItemModel;

#import "QPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QPHomeColumnModel : QPBaseModel

@property (nonatomic, strong) NSArray <QPColumnItemModel *> *columnList;

@property (nonatomic, assign) NSInteger defaultIndex;

@property (nonatomic, strong) NSMutableArray <QPColumnItemModel *> *availableColumnArr;

+ (instancetype)homeColumnModel;

@end

@interface QPColumnItemModel : QPBaseModel

@property (nonatomic, assign) BOOL show;
@property (nonatomic, strong) NSString *vcName;
@property (nonatomic, strong) NSString *vcTitle;

@property (nonatomic, strong) Class cls;

@end

NS_ASSUME_NONNULL_END
