//
//  UIColorAdditions.m
//  Shapes
//
//  Created by Anca Julean on 25/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "UIColorAdditions.h"
#include <stdlib.h>


@implementation UIColor(UIColorAdditions)

+ (UIColor *)randomColor {

    int red = rand() % 255;
    int blue = rand() % 255;
    int green = rand() % 255;
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

@end
