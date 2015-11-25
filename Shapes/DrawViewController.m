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


@interface DrawViewController() <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSString *currentShape;
@property (nonatomic, strong) NSArray *shapes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shapes = [(AppDelegate *)[UIApplication sharedApplication].delegate allShapes];
    self.currentShape = self.shapes[0];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.shapes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shapeCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shapeCell"];
    }
    
    cell.textLabel.text = self.shapes[indexPath.row];
    
    cell.accessoryType = [self.shapes[indexPath.row] isEqualToString:self.currentShape] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.currentShape = self.shapes[indexPath.row];
    [tableView reloadData];
}

#pragma mark - UIGestureRecognizer handlers

- (IBAction)handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    ShapeView *shapeView = [[ShapeView alloc] initWithShape:self.currentShape];
    shapeView.center = [tapGestureRecognizer locationInView:self.view];
    
    [self.view addSubview:shapeView];

    self.tableView.hidden = YES;
    
}

#pragma mark UIGestureRecognizerDelegate methods

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isDescendantOfView:self.tableView]) {
        
        // Don't let selections of table cells fire the gesture recognizer
        return NO;
    }
    
    return YES;
}

#pragma mark - Buttons Actions

- (IBAction)clearButtonClicked:(id)sender {
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[ShapeView class]]) {
            [subview removeFromSuperview];
        }
    }
}

- (IBAction)shapesClicked:(id)sender {
    self.tableView.hidden = !self.tableView.hidden;
    if (!self.tableView.hidden) {
        [self.view bringSubviewToFront:self.tableView];
    }
}

@end
