//
//  AddIngredientViewController.h
//  Recipes
//
//  Created by Adam on 19/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesViewController;
@class IngredientsViewController;

@interface AddIngredientViewController : UIViewController {
	NSString *recipeName;
	IBOutlet RecipesViewController *recipesController;
	IBOutlet IngredientsViewController *ingredientsController;
	IBOutlet UITextField *textField;
	IBOutlet UITableViewCell *textFieldCell;
}

@property (nonatomic,retain) NSString *recipeName;
@property (nonatomic,retain) RecipesViewController *recipesController;
@property (nonatomic,retain) IngredientsViewController *ingredientsController;

@end
