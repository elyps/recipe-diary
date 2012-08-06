//
//  RecipesAppDelegate.h
//  Recipes
//
//  Created by Adam on 17/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesViewController;
@class IngredientsViewController;
@class AddIngredientViewController;

@interface RecipesAppDelegate : NSObject <UIApplicationDelegate> {
	NSMutableDictionary *data;
    UIWindow *window;
	UINavigationController *navController;
    RecipesViewController *recipesController;
	IngredientsViewController *ingredientsController;
	AddIngredientViewController *addIngredientController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;
@property (nonatomic, retain) IBOutlet RecipesViewController *recipesController;
@property (nonatomic, retain) IBOutlet IngredientsViewController *ingredientsController;
@property (nonatomic, retain) IBOutlet AddIngredientViewController *addIngredientController;
@property (readonly) NSArray *recipes;

- (void)recipeClicked:(NSString *)recipeName;
- (void)addRecipe:(NSString *)recipeName;
- (void)removeRecipe:(NSString *)recipeName;
- (void)addIngredient:(NSString *)ingredientName forRecipe:(NSString *)recipe;
- (void)removeIngredient:(NSString *)ingredientName forRecipe:(NSString *)recipe;
- (void)displayAddNewIngredientScreen:(NSString *)recipeName;

@end

