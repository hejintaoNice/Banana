//
//  WXNewsResult.m
//
//  Created by Heige  on 16/6/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WXNewsResult.h"
#import "WXNewsList.h"


NSString *const kWXNewsResultPno = @"pno";
NSString *const kWXNewsResultList = @"list";
NSString *const kWXNewsResultTotalPage = @"totalPage";
NSString *const kWXNewsResultPs = @"ps";


@interface WXNewsResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WXNewsResult

@synthesize pno = _pno;
@synthesize list = _list;
@synthesize totalPage = _totalPage;
@synthesize ps = _ps;


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
            self.pno = [[self objectOrNilForKey:kWXNewsResultPno fromDictionary:dict] doubleValue];
    NSObject *receivedWXNewsList = [dict objectForKey:kWXNewsResultList];
    NSMutableArray *parsedWXNewsList = [NSMutableArray array];
    if ([receivedWXNewsList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWXNewsList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWXNewsList addObject:[WXNewsList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWXNewsList isKindOfClass:[NSDictionary class]]) {
       [parsedWXNewsList addObject:[WXNewsList modelObjectWithDictionary:(NSDictionary *)receivedWXNewsList]];
    }

    self.list = [NSArray arrayWithArray:parsedWXNewsList];
            self.totalPage = [[self objectOrNilForKey:kWXNewsResultTotalPage fromDictionary:dict] doubleValue];
            self.ps = [[self objectOrNilForKey:kWXNewsResultPs fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pno] forKey:kWXNewsResultPno];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kWXNewsResultList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kWXNewsResultTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ps] forKey:kWXNewsResultPs];

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

    self.pno = [aDecoder decodeDoubleForKey:kWXNewsResultPno];
    self.list = [aDecoder decodeObjectForKey:kWXNewsResultList];
    self.totalPage = [aDecoder decodeDoubleForKey:kWXNewsResultTotalPage];
    self.ps = [aDecoder decodeDoubleForKey:kWXNewsResultPs];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pno forKey:kWXNewsResultPno];
    [aCoder encodeObject:_list forKey:kWXNewsResultList];
    [aCoder encodeDouble:_totalPage forKey:kWXNewsResultTotalPage];
    [aCoder encodeDouble:_ps forKey:kWXNewsResultPs];
}

- (id)copyWithZone:(NSZone *)zone
{
    WXNewsResult *copy = [[WXNewsResult alloc] init];
    
    if (copy) {

        copy.pno = self.pno;
        copy.list = [self.list copyWithZone:zone];
        copy.totalPage = self.totalPage;
        copy.ps = self.ps;
    }
    
    return copy;
}


@end
