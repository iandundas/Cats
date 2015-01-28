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
+ (UIColor *)randomColorfulColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];

    return color;
}

@end