//
// Created by Ian Dundas on 16/01/15.
// Copyright (c) 2015 Ian Dundas. All rights reserved.
//

#import "UIColor+cats.h"

// private class extension
@interface UIColor (cats)
@end

@implementation UIColor (cats)
+ (UIColor *)randomColor {
    return [UIColor colorWithHue:drand48() saturation:drand48() brightness:drand48() alpha:1];
}

@end