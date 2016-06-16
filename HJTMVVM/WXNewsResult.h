//
//  WXNewsResult.h
//
//  Created by Heige  on 16/6/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WXNewsResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double pno;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) double totalPage;
@property (nonatomic, assign) double ps;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
