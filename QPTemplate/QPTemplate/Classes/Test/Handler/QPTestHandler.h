//
//  QPTestHandler.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TestHandleSuccessBlock)(id obj);
typedef void(^TestHandleFailureBlock)(id obj);

@interface QPTestHandler : NSObject

+ (void)handleGetURLRequestWithSuccess:(TestHandleSuccessBlock)success
                               failure:(TestHandleFailureBlock)failure;

+ (void)handleGetPublicKeyRequestWithSuccess:(TestHandleSuccessBlock)success
                                     failure:(TestHandleFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
