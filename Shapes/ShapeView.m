//
//  ShapeView.m
//  Shapes
//
//  Created by Anca Julean on 25/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "ShapeView.h"
#import "UIColorAdditions.h"

@implementation ShapeView

static CGSize kShapeSize = (CGSize){100.0, 120.0};

- (id)initWithShape:(NSString *)shape {
    self = [super initWithFrame:(CGRect){CGPointZero, kShapeSize}];
    _shape = shape;
    self.text = _shape;
    self.font = [UIFont systemFontOfSize:80.0];
    self.textColor = [UIColor randomColor];
    self.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self addGestureRecognizer:panGestureRecognizer];
    
    return self;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    if (panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [panGesture locationInView:self.superview];
        self.center = point;
    }
}

@end