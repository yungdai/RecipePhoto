//
//  RecipeCollectionViewController.h
//  RecipePhoto
//
//  Created by Yung Dai on 2015-04-22.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeCollectionViewController : UICollectionViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;
- (IBAction)shareButtonTapped:(id)sender;


@end
