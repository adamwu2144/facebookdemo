//
//  MemberPostViewClass.m
//  facebookdemo
//
//  Created by fg on 2015/3/23.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import "MemberPostViewClass.h"

@implementation MemberPostViewClass

@synthesize title,unReadNum,visitNum,joinNum,imageURL,name,content,createTime;

-(id)initWithData:(NSDictionary *)aData{
    self = [super init];
    if(self){
        
        title = [aData objectForKey:@"title"];
        if([title isKindOfClass:[NSNull class]]){
            title = @"";
        }
        
        unReadNum = [aData objectForKey:@"unReadNum"];
        if([unReadNum isKindOfClass:[NSNull class]]){
            unReadNum = [NSNumber numberWithInt:0];
        }
        
        visitNum = [aData objectForKey:@"visitNum"];
        if([visitNum isKindOfClass:[NSNull class]]){
            visitNum = [NSNumber numberWithInt:0];
        }
        
        joinNum = [aData objectForKey:@"joinNum"];
        if([joinNum isKindOfClass:[NSNull class]]){
            joinNum = [NSNumber numberWithInt:0];
        }
        
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
