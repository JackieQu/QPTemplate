//
//  QPEncryptHelper.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QPEncryptHelper : NSObject

+ (SecKeyRef)getPublicKeyRefWithExponentStr:(NSString *)exponent
                                 modulusStr:(NSString *)modulus;

+ (NSString *)getEncryptStrWithOriginalStr:(NSString *)originalStr;

@end

NS_ASSUME_NONNULL_END
