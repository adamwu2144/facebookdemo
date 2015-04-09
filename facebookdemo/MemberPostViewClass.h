//
//  MemberPostViewClass.h
//  facebookdemo
//
//  Created by fg on 2015/3/23.
//  Copyright (c) 2015年 fg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberPostViewClass : NSObject{

    NSString *title;
    NSNumber *unReadNum;
    NSNumber *visitNum;
    NSNumber *joinNum;
    NSString *imageURL;
    NSString *name;
    NSString *content;
    NSDate *createTime;
}

@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSNumber *unReadNum;
@property (nonatomic, retain)NSNumber *visitNum;
@property (nonatomic, retain)NSNumber *joinNum;
@property (nonatomic, retain)NSString *imageURL;
@property (nonatomic, retain)NSString *name;
@property (nonatomic, retain)NSString *content;
@property (nonatomic, retain)NSDate *createTime;

-(id)initWithData:(NSDictionary *)aData;

@end
