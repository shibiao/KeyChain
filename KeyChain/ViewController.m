//
//  ViewController.m
//  KeyChain
//
//  Created by sycf_ios on 2017/7/13.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "ViewController.h"
#import "SBKeyChain.h"

NSString * const KEY_USERNAME_PASSWORD = @"com.company.app.usernamepassword";
NSString * const KEY_USERNAME = @"com.company.app.username";
NSString * const KEY_PASSWORD = @"com.company.app.password";
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
    [userNamePasswordKVPairs setObject:@"userName" forKey:KEY_USERNAME];
    [userNamePasswordKVPairs setObject:@"password" forKey:KEY_PASSWORD];
    NSLog(@"%@", userNamePasswordKVPairs); //有KV值
    
    // A、将用户名和密码写入keychain
    [SBKeyChain save:KEY_USERNAME_PASSWORD data:userNamePasswordKVPairs];
    
    // B、从keychain中读取用户名和密码
    NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[SBKeyChain load:KEY_USERNAME_PASSWORD];
    NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
    NSString *password = [readUsernamePassword objectForKey:KEY_PASSWORD];
    NSLog(@"username = %@", userName);
    NSLog(@"password = %@", password);
    
    // C、将用户名和密码从keychain中删除
    [SBKeyChain delete:KEY_USERNAME_PASSWORD];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
