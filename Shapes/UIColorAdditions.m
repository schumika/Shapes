//
//  UIColorAdditions.m
//  Shapes
//
//  Created by Anca Julean on 25/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "UIColorAdditions.h"


@implementation UIColor(UIColorAdditions)

+ (UIColor *)randomColor {

    NSUInteger red = arc4random_uniform(256);
    NSUInteger blue = arc4random_uniform(256);
    NSUInteger green = arc4random_uniform(256);
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
