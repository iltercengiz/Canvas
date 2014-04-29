//
//  CollectionViewController.m
//  Canvas
//
//  Created by Ilter Cengiz on 04/04/14.
//  Copyright (c) 2014 webBox.io. All rights reserved.
//

#import "PagerViewController.h"
#import "PagerLayout.h"

#define NAVIGATION_BAR_HEIGHT 64.0
#define CELL_MARGIN 10.0

#define CELL_WIDTH_IPAD 280.0
#define CELL_WIDTH_IPHONE 280.0

@interface PagerViewController ()

@end

@implementation PagerViewController

#pragma mark - UIViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self.collectionView setCollectionViewLayout:[PagerLayout new]];
    }
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(10.0, 20.0, 10.0, 20.0);
    
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    self.collectionView.scrollsToTop = NO;
    
}
- (void)viewWillLayoutSubviews {
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        layout.itemSize = CGSizeMake(CELL_WIDTH_IPAD, CGRectGetHeight(self.collectionView.frame) - NAVIGATION_BAR_HEIGHT - 2 * CELL_MARGIN);
    } else { // if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        layout.itemSize = CGSizeMake(CELL_WIDTH_IPHONE, CGRectGetHeight(self.collectionView.frame) - NAVIGATION_BAR_HEIGHT - 2 * CELL_MARGIN);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
        layout.itemSize = CGSizeMake(CELL_WIDTH_IPAD, CGRectGetWidth(self.collectionView.frame) - NAVIGATION_BAR_HEIGHT - 2 * CELL_MARGIN);
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 32.0, CGRectGetWidth(cell.frame), 32.0)];
        label.tag = 1;
        label.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:label];
    }
    
    label.text = [NSString stringWithFormat:@"Cell %li", (long)indexPath.item];
    
    return cell;
    
}

@end
