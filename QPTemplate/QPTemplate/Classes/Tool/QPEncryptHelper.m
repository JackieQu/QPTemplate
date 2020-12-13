//
//  QPEncryptHelper.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPEncryptHelper.h"
#import "NSData+Hex.h"
#import "DDRSAWrapper.h"

@implementation QPEncryptHelper

+ (SecKeyRef)getPublicKeyRefWithExponentStr:(NSString *)exponent
                                 modulusStr:(NSString *)modulus {
    
    if (isNullStr(exponent) || isNullStr(modulus)) {
        return nil;
    }
    
    NSData *expData = [NSData dataWithHexStr:exponent];
    NSData *modData = [NSData dataWithHexStr:modulus];
    
    DDRSAWrapper *rsaWrapper = [[DDRSAWrapper alloc] init];
    SecKeyRef pubKeyRef = [rsaWrapper publicKeyDataWithMod:modData exp:expData];
    
    NSData *pubKeyData = [rsaWrapper publicKeyBitsFromSecKey:pubKeyRef];
    [[NSUserDefaults standardUserDefaults] setObject:pubKeyData forKey:@"TEST_PUBLIC_KEY"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return pubKeyRef;
}

+ (NSString *)getEncryptStrWithOriginalStr:(NSString *)originalStr {
    
    if (isNullStr(originalStr)) {
        return nil;
    }
    
    NSData * pubKeyData = [[NSUserDefaults standardUserDefaults] objectForKey:@"TEST_PUBLIC_KEY"];
    if (!pubKeyData) {
        return nil;
    }
    
    DDRSAWrapper *rsaWrapper = [[DDRSAWrapper alloc] init];
    SecKeyRef pubKeySef = [rsaWrapper publicSecKeyFromKeyBits:pubKeyData];
    
    NSData *encodeData = [originalStr dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptData = [rsaWrapper encryptWithKey:pubKeySef plainData:encodeData padding:kSecPaddingNone];
    NSString *encryptStr = [encryptData hexRepresentationWithSpaces:NO capitals:YES];
    return encryptStr;
}

@end
