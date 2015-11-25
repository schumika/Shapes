//
//  ShapeView.m
//  Shapes
//
//  Created by Anca Julean on 25/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

static CGSize kShapeSize = (CGSize){100.0, 120.0};

- (id)initWithShape:(NSString *)shape {
    self = [super initWithFrame:(CGRect){CGPointZero, kShapeSize}];
    _shape = shape;
    self.text = _shape;
    self.font = [UIFont systemFontOfSize:80.0];
    
    return self;
}

@end