//
//  AddRecipesViewController.h
//  Recipes
//
//  Created by Adam on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesViewController;

@interface AddRecipeViewController : UIViewController <UITableViewDataSource> {
	IBOutlet UITextField *textField;
	IBOutlet UITableViewCell *textFieldCell;
	RecipesViewController *recipesController;
}

- (IBAction)addRecipe;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
