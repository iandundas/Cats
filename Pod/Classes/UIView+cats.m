//
// Created by Ian Dundas on 01/12/14.
//

#import "NSView+cats.h"

@implementation NSView (cats)
- (id) superviewWithClass:(Class)klass{
    id view = [self superview];
    while (view && [view isKindOfClass:klass] == NO) {
        view = [view superview];
    }
    return view; // returns nil if not found (i.e. no superview)
}
@end