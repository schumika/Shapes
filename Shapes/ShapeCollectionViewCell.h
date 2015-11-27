//
//  ShapeCollectionViewCell.h
//  Shapes
//
//  Created by Anca Julean on 24/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShapeCollectionViewCellDelegate;


@interface ShapeCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *shapeLabel;
@property (nonatomic, assign) id<ShapeCollectionViewCellDelegate> delegate;

@end


@protocol ShapeCollectionViewCellDelegate <NSObject>

- (void)shapeCellTapped:(ShapeCollectionViewCell *)cell;

@end
