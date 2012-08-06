//
//  RecipesAppDelegate.h
//  Recipes
//
//  Created by bill on 6/5/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesViewController;
@class IngredientsViewController;
@class AddIngredientViewController;

@interface RecipesAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet RecipesViewController *recipesController;
	IBOutlet UINavigationController *navController;
	IBOutlet IngredientsViewController *ingredientsController;
	IBOutlet AddIngredientViewController *addIngredientController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RecipesViewController *recipesController;
@property (nonatomic, retain) IngredientsViewController *ingredientsController;
@property (nonatomic, retain) AddIngredientViewController *addIngredientController;

@property (readonly) NSArray *recipes;

- (void)recipeClicked:(NSString *)recipeName;
- (void)addRecipe:(NSString *)recipeName;
- (void)removeRecipe:(NSString *)recipeName;
- (void)addIngredient:(NSString *)ingredient forRecipe:(NSString *)recipe;
- (void)removeIngredient:(NSString *)ingredient forRecipe:(NSString *)recipe;
- (void)moveIngredientForRecipe:(NSString *)recipeName atIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
- (void)displayAddNewIngredientScreen:(NSString *)recipeName;

@end

