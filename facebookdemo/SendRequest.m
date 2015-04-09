//
//  SendRequest.m
//  expandZoom
//
//  Created by fg on 2015/4/2.
//  Copyright (c) 2015年 Kyle Fang. All rights reserved.
//

#import "SendRequest.h"

@implementation SendRequest

+ (NSString *)sendSynRequestGet:(NSString *)URLString{
    NSString *url = URLString;
    NSMutableURLRequest *requestClient = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    [requestClient setHTTPMethod: @"GET"];
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    NSData *resultData = [NSURLConnection sendSynchronousRequest: requestClient returningResponse: &urlResponse error: &requestError];
    NSString *jsonStr = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    
    return jsonStr;
}

+ (void)sendAsynRequestGet:(NSString *)URLString callback:(void (^)(NSURLResponse *response, NSData *data, NSError *error))Handler{
    NSString *url = URLString;
    NSMutableURLRequest *requestClient = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    [requestClient setHTTPMethod: @"GET"];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest: requestClient queue:queue completionHandler:Handler];
}


+ (NSString *)sendSynRequestPost:(NSString *)URLString postString:(NSString *)postString{
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *data = [postString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:url];
    [requst setHTTPMethod:@"POST"];
    [requst setValue:[NSString stringWithFormat:@"%d",(int)[data length]] forHTTPHeaderField:@"Content-Length"];
    [requst setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [requst setHTTPBody:data];
    NSData *resultData = [NSURLConnection sendSynchronousRequest:requst returningResponse:nil error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    
    return jsonStr;
}

+ (void)sendASynRequestPost:(NSString *)URLString postString:(NSString *)postString  callback:(void (^)(NSURLResponse *response, NSData *data, NSError *error))Handler{
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *data = [postString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:url];
    [requst setHTTPMethod:@"POST"];
    [requst setValue:[NSString stringWithFormat:@"%d",(int)[data length]] forHTTPHeaderField:@"Content-Length"];
    [requst setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [requst setHTTPBody:data];
    NSOperationQueue *queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:requst queue:queue completionHandler:Handler];
}

+ (NSDictionary *)jasonConvertToDictionary:(NSData *)data{
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return jsonDictionary;
}

+ (NSArray *)jasonConvertToArray:(NSData *)data{
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return jsonArray;
}

+ (void)loadData:(NSString *)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    __block NSURLSessionDataTask *dataTask;
    dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"data = %@",jsonDict);
        [dataTask cancel];
        dataTask = nil;
    }];
    [dataTask resume];
}



@end
