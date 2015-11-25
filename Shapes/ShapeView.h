//
//  ShapeView.h
//  Shapes
//
//  Created by Anca Julean on 25/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShapeView : UILabel

@property (nonatomic, strong) NSString *shape;

- (id)initWithShape:(NSString *)shape;

@end
