//
//  RecipeCollectionViewController.m
//  RecipePhoto
//
//  Created by Yung Dai on 2015-04-22.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import "RecipeCollectionViewController.h"
// import the RecipeCollecitonView Model to the RecipeCollectionViewController
#import "RecipeCollectionViewCell.h"

@interface RecipeCollectionViewController ()

@end

@implementation RecipeCollectionViewController {
    //declare an array for the recipeImages;
    NSArray *recipeImages;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Register cell classes
    // [self.collectionView registerClass:[RecipeCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // Initialize image array
    recipeImages = @[@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg",
                     @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg",
                     @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg",  @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg"];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return recipeImages.count   ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RecipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    // Configure the cell
    cell.recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
