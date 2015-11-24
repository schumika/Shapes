//
//  ViewController.m
//  Shapes
//
//  Created by Anca Julean on 24/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "ViewController.h"
#import "ShapeCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *shapesArray;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeightConstraint;

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
    
    self.menuHeightConstraint.constant = 0.0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.shapesArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShapeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShapeCollectionViewCell" forIndexPath:indexPath];
    
    cell.shapeLabel.text = self.shapesArray[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OptionCell"];
    }
    
    cell.textLabel.text = @"Smth";
    
    return cell;
}

- (IBAction)menuButtonAction:(id)sender {
    CGFloat menuHeight = (self.menuHeightConstraint.constant == 0.0) ? 75.0 : 0.0;
    
    CGRect finalFrame = self.menuTableView.frame;
    finalFrame.size.height = menuHeight;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.menuTableView.frame = finalFrame;
                     }
                     completion:^(BOOL finished) {
                         self.menuHeightConstraint.constant = menuHeight;
                     }
     ];
}

@end
