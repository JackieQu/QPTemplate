//
//  QPTestHandler.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPTestHandler.h"
#import "QPTestURLModel.h"
#import "QPTestPublicKeyModel.h"
#import <MJExtension.h>

@implementation QPTestHandler

+ (void)handleGetURLRequestWithSuccess:(TestHandleSuccessBlock)success failure:(TestHandleFailureBlock)failure {
    
    [[QPHTTPManager sharedManager] requestWithMethod:GET path:API_GET_URL params:nil prepare:^{
        QPLog(@"请求服务器地址");
    } success:^(NSURLSessionTask * _Nonnull task, id  _Nullable responseObject) {
        QPTestURLModel *urlModel = [QPTestURLModel modelWithDict:responseObject];
        if (urlModel.success == 1) {
            [urlModel archive];
            if (success) {
                success(urlModel);
            }
        } else {
            if (failure) {
                failure(urlModel.errorInfo);
            }
        }
    } failure:^(NSURLSessionTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)handleGetPublicKeyRequestWithSuccess:(TestHandleSuccessBlock)success failure:(TestHandleFailureBlock)failure {
    
    NSString *path = [NSString stringWithFormat:@"%@%@", SERVER_PATH, API_GET_PUBLIC_KEY];
    [[QPHTTPManager sharedManager] requestWithMethod:GET path:path params:nil prepare:^{
        QPLog(@"请求公钥信息");
    } success:^(NSURLSessionTask * _Nonnull task, id  _Nullable responseObject) {
        QPTestPublicKeyModel *pubKeyModel = [QPTestPublicKeyModel modelWithDict:responseObject];
        if (pubKeyModel.status == 0) {
            [pubKeyModel.data archive];
            if (success) {
                success(pubKeyModel.data);
            }
        } else {
            if (failure) {
                failure(pubKeyModel.message);
            }
        }
    } failure:^(NSURLSessionTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
