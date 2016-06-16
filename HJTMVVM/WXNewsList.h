//
//  WXNewsList.h
//
//  Created by Heige  on 16/6/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WXNewsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *firstImg;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *mark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
