//
//  QPTestPublicKeyModel.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class QPPublicKeyDataModel;

@interface QPTestPublicKeyModel : QPBaseModel

@property (nonatomic, copy)   NSString *message;
@property (nonatomic, strong) QPPublicKeyDataModel *data;
@property (nonatomic, assign) NSInteger status;

@end

@interface QPPublicKeyDataModel : QPBaseModel

@property (nonatomic, copy) NSString *exponent;
@property (nonatomic, copy) NSString *modulus;

@end

NS_ASSUME_NONNULL_END
