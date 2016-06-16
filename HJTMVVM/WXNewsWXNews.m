//
//  WXNewsWXNews.m
//
//  Created by Heige  on 16/6/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WXNewsWXNews.h"
#import "WXNewsResult.h"


NSString *const kWXNewsWXNewsResult = @"result";
NSString *const kWXNewsWXNewsErrorCode = @"error_code";
NSString *const kWXNewsWXNewsReason = @"reason";


@interface WXNewsWXNews ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WXNewsWXNews

@synthesize result = _result;
@synthesize errorCode = _errorCode;
@synthesize reason = _reason;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.result = [WXNewsResult modelObjectWithDictionary:[dict objectForKey:kWXNewsWXNewsResult]];
            self.errorCode = [[self objectOrNilForKey:kWXNewsWXNewsErrorCode fromDictionary:dict] doubleValue];
            self.reason = [self objectOrNilForKey:kWXNewsWXNewsReason fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.result dictionaryRepresentation] forKey:kWXNewsWXNewsResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kWXNewsWXNewsErrorCode];
    [mutableDict setValue:self.reason forKey:kWXNewsWXNewsReason];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.result = [aDecoder decodeObjectForKey:kWXNewsWXNewsResult];
    self.errorCode = [aDecoder decodeDoubleForKey:kWXNewsWXNewsErrorCode];
    self.reason = [aDecoder decodeObjectForKey:kWXNewsWXNewsReason];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kWXNewsWXNewsResult];
    [aCoder encodeDouble:_errorCode forKey:kWXNewsWXNewsErrorCode];
    [aCoder encodeObject:_reason forKey:kWXNewsWXNewsReason];
}

- (id)copyWithZone:(NSZone *)zone
{
    WXNewsWXNews *copy = [[WXNewsWXNews alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.errorCode = self.errorCode;
        copy.reason = [self.reason copyWithZone:zone];
    }
    
    return copy;
}


@end
