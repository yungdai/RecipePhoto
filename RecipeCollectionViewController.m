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
#import "RecipeViewController.h"
#import <Social/Social.h>



@interface RecipeCollectionViewController ()

@end

@implementation RecipeCollectionViewController {
    //declare an array for the recipeImages;
    NSArray *recipeImages;
    
    // added two new variables to multitouch selection
    BOOL shareEnabled;
    NSMutableArray *selectedRecipes;
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
    
    // initialise the selectedRecipes array
    selectedRecipes = [NSMutableArray array];
    
}

// impliment a method for multiselection
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (shareEnabled) {
        // Determine the selected items by using the indexPath
        NSString *selectedRecipe = [recipeImages[indexPath.section]objectAtIndex:indexPath.row];
        //add the selected item to the array
        [selectedRecipes addObject:selectedRecipe];
    }
}

// impliment a method for deselection of a photo
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (shareEnabled) {
        NSString *deSelectedRecipe = [recipeImages[indexPath.section]objectAtIndex:indexPath.row];
        [selectedRecipes removeObject:deSelectedRecipe];
    }
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
    
    // insert in the photo frame selection code
    
    cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photo-frame-selected"]];
    
    return cell;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipePhoto"]) {
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        UINavigationController *destViewController = segue.destinationViewController;
        RecipeViewController *recipeViewController = (RecipeViewController *) [destViewController.childViewControllers firstObject];
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        recipeViewController.recipeImageName = [recipeImages[indexPath.section]objectAtIndex:indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
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

- (IBAction)shareButtonTapped:(id)sender {
    if (shareEnabled) {
        // Post selected photos to Facebook
        if ([selectedRecipes count] > 0) {
            if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                [controller setInitialText:@"Check out my recipes!"];
                for (NSString *recipePhoto in selectedRecipes) {
                    [controller addImage:[UIImage imageNamed:recipePhoto]];
                }
                [self presentViewController:controller animated:YES completion:nil];
            }
        }
        // Deselect all selected items
        for (NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        
        // Remove all items from selectedRecipes array
        [selectedRecipes removeAllObjects];
        // Change the sharing mode to NO
        shareEnabled = NO;
        self.collectionView.allowsMultipleSelection = NO;
        self.shareButton.title = @"Share";
        [self.shareButton setStyle:UIBarButtonItemStylePlain];
    } else {
        // Change shareEnabled to YES and change the button text to Upload
        shareEnabled = YES;
        self.collectionView.allowsMultipleSelection = YES;
        self.shareButton.title = @"Upload";
        [self.shareButton setStyle:UIBarButtonItemStyleDone];
    }
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (shareEnabled) {
        return NO;
    } else {
        return YES;
    }
}
@end