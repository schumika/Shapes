//
//  ShapeCollectionViewCell.m
//  Shapes
//
//  Created by Anca Julean on 24/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "ShapeCollectionViewCell.h"
#import "UIColorAdditions.h"


@implementation ShapeCollectionViewCell

- (void)awakeFromNib {
    self.shapeLabel.textColor = [UIColor randomColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.shapeLabel addGestureRecognizer:tapGesture];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    if ([self.delegate respondsToSelector:@selector(shapeCellTapped:)]) {
        [self.delegate shapeCellTapped:self];
    }
}

@end
