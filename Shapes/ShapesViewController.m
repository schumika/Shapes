//
//  ShapesViewController.m
//  Shapes
//
//  Created by Anca Julean on 24/11/15.
//  Copyright © 2015 Anca Julean. All rights reserved.
//

#import "ShapesViewController.h"
#import "ShapeCollectionViewCell.h"
#import "MenuTableViewCell.h"

@interface ShapesViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *shapesArray;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, assign) NSInteger selectedShapeTypeIndex;
@property (nonatomic, strong) NSArray *currentShapes;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeightConstraint;

@end

@implementation ShapesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shapesArray = @[@{@"Type":@"Animals",
                           @"Shapes":@[@"🐶", @"🐱", @"🐭", @"🐰", @"🐻", @"🦁", @"🐮", @"🐷", @"🐸", @"🐔", @"🐣", @"🐝", @"🐛", @"🐌", @"🐞", @"🐜", @"🐟", @"🐘", @"🐫", @"🐑"]},
                         @{@"Type":@"Food",
                           @"Shapes":@[@"🍎", @"🍐", @"🍊" ,@"🍋", @"🍌", @"🍉", @"🍇", @"🍓", @"🍒", @"🍍"]}];
    
    self.collectionView.pagingEnabled = YES;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    flowLayout.minimumInteritemSpacing = 0.0;
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    self.menuHeightConstraint.constant = 0.0;
    
    self.selectedShapeTypeIndex = 0;
    
    self.title = ((NSDictionary *)self.shapesArray[self.selectedShapeTypeIndex])[@"Type"];
    self.currentShapes = ((NSDictionary *)self.shapesArray[self.selectedShapeTypeIndex])[@"Shapes"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.currentShapes count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShapeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShapeCollectionViewCell" forIndexPath:indexPath];
    
    cell.shapeLabel.text = self.currentShapes[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.shapesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OptionCell" forIndexPath:indexPath];
    
    cell.titleLabel.text = ((NSDictionary *)self.shapesArray[indexPath.row])[@"Type"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedShapeTypeIndex = indexPath.row;
    [self menuButtonAction:nil];
}

- (void)setSelectedShapeTypeIndex:(NSInteger)selectedShapeTypeIndex {
    if (_selectedShapeTypeIndex != selectedShapeTypeIndex) {
        _selectedShapeTypeIndex = selectedShapeTypeIndex;
        
        self.title = ((NSDictionary *)self.shapesArray[self.selectedShapeTypeIndex])[@"Type"];
        self.currentShapes = ((NSDictionary *)self.shapesArray[self.selectedShapeTypeIndex])[@"Shapes"];
        
        [self.menuTableView reloadData];
        [self.collectionView reloadData];
    }
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
