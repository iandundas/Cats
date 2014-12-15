//
// Created by Ian Dundas on 01/12/14.
//

#import <Foundation/Foundation.h>

@interface UIView (cats)
// searches through superview stack to return containing view with class X if it exists, or returns nil
- (id) superviewWithClass:(Class)klass;
@end