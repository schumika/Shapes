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
}

@end
