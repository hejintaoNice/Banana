//
//  WXNewsWXNews.h
//
//  Created by Heige  on 16/6/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WXNewsResult;

@interface WXNewsWXNews : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) WXNewsResult *result;
@property (nonatomic, assign) double errorCode;
@property (nonatomic, strong) NSString *reason;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
