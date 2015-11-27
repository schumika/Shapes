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
    
    CGFloat redLevel    = rand() / (float) RAND_MAX;
    CGFloat greenLevel  = rand() / (float) RAND_MAX;
    CGFloat blueLevel   = rand() / (float) RAND_MAX;
    
    return [UIColor colorWithRed: redLevel
                           green: greenLevel
                            blue: blueLevel
                           alpha: 1.0];
}

@end
