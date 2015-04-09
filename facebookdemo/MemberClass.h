//
//  MemberClass.h
//  facebookdemo
//
//  Created by fg on 2015/3/20.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberClass : NSObject{
    NSString *imageURL;
    NSString *name;
    NSString *content;
    NSDate *createTime;
}

@property (nonatomic, retain)NSString *imageURL;
@property (nonatomic, retain)NSString *name;
@property (nonatomic, retain)NSString *content;
@property (nonatomic, retain)NSDate *createTime;

-(id)initWithData:(NSDictionary *)aData;

@end
