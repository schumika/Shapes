//
//  ViewController.m
//  Shapes
//
//  Created by Anca Julean on 24/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "ViewController.h"
#import "ShapeCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *shapesArray;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shapesArray = @[@"🐶", @"🐱", @"🐭", @"🐰", @"🐻", @"🦁", @"🐮", @"🐷", @"🐸", @"🐔", @"🐣", @"🐝", @"🐛", @"🐌", @"🐞", @"🐜", @"🐟", @"🐘", @"🐫", @"🐑"];
    self.title = @"Animals";
    
    self.collectionView.pagingEnabled = YES;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    flowLayout.minimumInteritemSpacing = 0.0;
    [self.collectionView setCollectionViewLayout:flowLayout];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.shapesArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShapeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShapeCollectionViewCell" forIndexPath:indexPath];
    
    cell.shapeLabel.text = self.shapesArray[indexPath.row];
    
    return cell;
}

@end
