//
//  SBKeyChain.h
//  KeyChain
//
//  Created by sycf_ios on 2017/7/13.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBKeyChain : NSObject
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;

// save username and password to keychain
+ (void)save:(NSString *)service data:(id)data;

// load username and password from keychain
+ (id)load:(NSString *)service;

// delete username and password from keychain
+ (void)delete:(NSString *)serviece;
@end
