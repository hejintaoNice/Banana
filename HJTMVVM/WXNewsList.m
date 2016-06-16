//
//  WXNewsList.m
//
//  Created by Heige  on 16/6/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WXNewsList.h"


NSString *const kWXNewsListFirstImg = @"firstImg";
NSString *const kWXNewsListId = @"id";
NSString *const kWXNewsListTitle = @"title";
NSString *const kWXNewsListSource = @"source";
NSString *const kWXNewsListUrl = @"url";
NSString *const kWXNewsListMark = @"mark";


@interface WXNewsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WXNewsList

@synthesize firstImg = _firstImg;
@synthesize listIdentifier = _listIdentifier;
@synthesize title = _title;
@synthesize source = _source;
@synthesize url = _url;
@synthesize mark = _mark;


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
            self.firstImg = [self objectOrNilForKey:kWXNewsListFirstImg fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kWXNewsListId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kWXNewsListTitle fromDictionary:dict];
            self.source = [self objectOrNilForKey:kWXNewsListSource fromDictionary:dict];
            self.url = [self objectOrNilForKey:kWXNewsListUrl fromDictionary:dict];
            self.mark = [self objectOrNilForKey:kWXNewsListMark fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.firstImg forKey:kWXNewsListFirstImg];
    [mutableDict setValue:self.listIdentifier forKey:kWXNewsListId];
    [mutableDict setValue:self.title forKey:kWXNewsListTitle];
    [mutableDict setValue:self.source forKey:kWXNewsListSource];
    [mutableDict setValue:self.url forKey:kWXNewsListUrl];
    [mutableDict setValue:self.mark forKey:kWXNewsListMark];

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

    self.firstImg = [aDecoder decodeObjectForKey:kWXNewsListFirstImg];
    self.listIdentifier = [aDecoder decodeObjectForKey:kWXNewsListId];
    self.title = [aDecoder decodeObjectForKey:kWXNewsListTitle];
    self.source = [aDecoder decodeObjectForKey:kWXNewsListSource];
    self.url = [aDecoder decodeObjectForKey:kWXNewsListUrl];
    self.mark = [aDecoder decodeObjectForKey:kWXNewsListMark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_firstImg forKey:kWXNewsListFirstImg];
    [aCoder encodeObject:_listIdentifier forKey:kWXNewsListId];
    [aCoder encodeObject:_title forKey:kWXNewsListTitle];
    [aCoder encodeObject:_source forKey:kWXNewsListSource];
    [aCoder encodeObject:_url forKey:kWXNewsListUrl];
    [aCoder encodeObject:_mark forKey:kWXNewsListMark];
}

- (id)copyWithZone:(NSZone *)zone
{
    WXNewsList *copy = [[WXNewsList alloc] init];
    
    if (copy) {

        copy.firstImg = [self.firstImg copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.mark = [self.mark copyWithZone:zone];
    }
    
    return copy;
}


@end
