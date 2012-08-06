//
//  RecipesViewController.h
//  Recipes
//
//  Created by Adam on 17/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesAppDelegate;
@class AddRecipeViewController;

@interface RecipesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	IBOutlet RecipesAppDelegate *appDelegate;
	IBOutlet AddRecipeViewController *addRecipeController;
	IBOutlet UITableView *tableView;
}

- (void)addRecipe:(NSString *)recipeName;
- (void)removeRecipe:(NSString *)recipeName;
- (void)addIngredient:(NSString *)ingredientName forRecipe:(NSString *)recipe;
- (void)removeIngredient:(NSString *)ingredientName forRecipe:(NSString *)recipe;
- (void)moveIngredientForRecipe:(NSString *)recipeName atIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
- (void)displayAddNewIngredientScreen:(NSString *)recipeName;

@end

