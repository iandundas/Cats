//
// Created by Ian Dundas on 01/12/14.
//

#import "NSArray+cats.h"

@implementation NSArray (cats)
-(BOOL)hasObjectAtIndex:(NSUInteger)index{
    return index >= 0 && index < self.count;
}
@end