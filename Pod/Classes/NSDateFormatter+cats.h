//
// Created by Ian Dundas on 03/02/2014.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (cats)
+ (NSDateFormatter *)yyyyMMddFormatterInstance;

+ (NSDateFormatter *)ddMMyyFormatterInstance;

+ (NSDateFormatter *)ddMMyyyyFormatterInstance;

+ (NSDateFormatter *)dutchDateTimeFormatterInstance;

+ (NSDateFormatter *)timeFormatterWithSecondsInstance;
+ (NSDateFormatter *)ISO8601DateTimeFormatterInstance;


+ (NSDateFormatter *)ISO8601WithMillisecondsDateTimeFormatterInstance;
@end