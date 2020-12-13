//
//  QPTestURLModel.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class QPURLResultModel;

@interface QPTestURLModel : QPBaseModel

@property (nonatomic, copy)   NSString *errorInfo;
@property (nonatomic, strong) QPURLResultModel *results;
@property (nonatomic, assign) NSInteger success;

@end

@interface QPURLResultModel : QPBaseModel

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy)   NSString *server_url_cb;
@property (nonatomic, copy)   NSString *server_url_xy;
@property (nonatomic, copy)   NSString *edition;

@end

NS_ASSUME_NONNULL_END
