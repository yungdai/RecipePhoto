//
//  RecipeViewController.h
//  RecipePhoto
//
//  Created by Yung Dai on 2015-04-28.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

@interface RecipeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *recipeImageView;

- (IBAction)close:(id)sender;

// addinging the recipeImageName property to the ReceipeViewController
@property (weak, nonatomic) NSString *recipeImageName;

@end
