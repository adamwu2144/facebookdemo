//
//  SendRequest.h
//  expandZoom
//
//  Created by fg on 2015/4/2.
//  Copyright (c) 2015年 Kyle Fang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SendRequest : NSObject<NSURLSessionDelegate>

+ (NSString *)sendSynRequestGet:(NSString *)URLString;
+ (NSString *)sendSynRequestPost:(NSString *)URLString postString:(NSString *)postString;
+ (NSDictionary *)jasonConvertToDictionary:(NSData *)data;
+ (NSArray *)jasonConvertToArray:(NSData *)data;

+ (void)sendASynRequestPost:(NSString *)URLString postString:(NSString *)postString callback:(void (^)(NSURLResponse *response, NSData *data, NSError *error))Handler;
+ (void)sendAsynRequestGet:(NSString *)URLString callback:(void (^)(NSURLResponse *response, NSData *data, NSError *error))Handler;

+ (void)loadData:(NSString *)urlStr;
@end
