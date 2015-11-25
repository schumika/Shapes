//
//  DrawViewController.m
//  Shapes
//
//  Created by Anca Julean on 25/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "DrawViewController.h"
#import "AppDelegate.h"
#import "ShapeView.h"


@interface DrawViewController()

@property (nonatomic, strong) NSString *currentShape;
@property (nonatomic, strong) NSArray *shapes;

@end


@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shapes = [(AppDelegate *)[UIApplication sharedApplication].delegate allShapes];
    self.currentShape = self.shapes[0];
}

- (IBAction)handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    ShapeView *shapeView = [[ShapeView alloc] initWithShape:self.currentShape];
    shapeView.center = [tapGestureRecognizer locationInView:self.view];
    
    [self.view addSubview:shapeView];
    
}

- (IBAction)clearButtonClicked:(id)sender {
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[ShapeView class]]) {
            [subview removeFromSuperview];
        }
    }
}

@end
