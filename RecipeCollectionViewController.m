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
// import the RecipeCollectionHeaderView Model to the RecipeCollectionViewController
#import "RecipeCollectionHeaderView.h"


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
    NSArray *mainDishImages = @[@"egg_benedict.jpg", @"full_breakfast.jpg",
                                @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg",
                                @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg",
                                @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"thai_shrimp_cake.jpg",
                                @"vegetable_curry.jpg"];
    NSArray *drinkDessertImages = @[@"angry_birds_cake.jpg", @"creme_brelee.jpg",
                                    @"green_tea.jpg", @"starbucks_coffee.jpg", @"white_chocolate_donut.jpg"];
    
    // recipeImages array now has arrays inside the array
    recipeImages = @[mainDishImages, drinkDessertImages];
    
    // adding section spacing
    UICollectionViewFlowLayout *collectionViewLayout =  (UICollectionViewFlowLayout *) self.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);

}

// implement the viewForSupplementaryElementOfKind: method
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%ld", indexPath.section +1];
        headerView.titleLabel.text = title;
        reusableView = headerView;
        
    }
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        reusableView = footerView;
    }
    return reusableView;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return [recipeImages count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // method to return the number of items for each section in the array within the array
    return [[recipeImages objectAtIndex:section]count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RecipeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    // Configure the cell
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photo-frame"]];
    
    // rewrite of the cell image view into groups
    cell.recipeImageView.image = [UIImage imageNamed:[recipeImages[indexPath.section]objectAtIndex:indexPath.row]];
    
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
