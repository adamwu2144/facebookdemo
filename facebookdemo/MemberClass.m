//
//  MemberClass.m
//  facebookdemo
//
//  Created by fg on 2015/3/20.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "MemberClass.h"

@implementation MemberClass

@synthesize imageURL,name,content,createTime;

-(id)initWithData:(NSDictionary *)aData{
    self = [super init];
    if(self){
        imageURL = [aData objectForKey:@"imageURL"];
        if([imageURL isKindOfClass:[NSNull class]]){
            imageURL = @"";
        }
        
        name = [aData objectForKey:@"name"];
        if([name isKindOfClass:[NSNull class]]){
            name = @"";
        }
        
        content = [aData objectForKey:@"content"];
        if([content isKindOfClass:[NSNull class]]){
            content = @"";
        }
        
        if([createTime isKindOfClass:[NSNull class]]){
            createTime = [NSDate date];
        }
        else{
            createTime = [NSDate dateWithTimeIntervalSince1970:[[aData objectForKey:@"createTime"] doubleValue]];
        }
    }
    return self;
}

@end
