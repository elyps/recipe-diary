//
//  RecipesAppDelegate.m
//  Recipes
//
//  Created by bill on 6/5/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "RecipesAppDelegate.h"
#import "RecipesViewController.h"
#import "IngredientsViewController.h"
#import "AddIngredientViewController.h"
#import "SQLiteAccess.h"

@implementation RecipesAppDelegate

@synthesize window;
@synthesize recipesController;
//@synthesize recipes;
@synthesize ingredientsController;
@synthesize addIngredientController;

- (NSArray *)recipes {
	return [SQLiteAccess selectManyValuesWithSQL:@"SELECT recipe_name FROM recipe"];
}

- (void)addRecipe:(NSString *)recipeName {
	NSString *sql = [NSString stringWithFormat:@"INSERT INTO recipe (recipe_name) VALUES ('%@')", recipeName];
	[SQLiteAccess insertWithSQL:sql];
}

- (void)removeRecipe:(NSString *)recipeName {
	NSString *sql = [NSString stringWithFormat:@"SELECT recipe_id FROM recipe WHERE recipe_name = '%@'", recipeName];
	NSString *recipe_id = [SQLiteAccess selectOneValueSQL:sql];
	sql = [NSString stringWithFormat:@"DELETE FROM recipe WHERE recipe_id = %@", recipe_id];
	[SQLiteAccess deleteWithSQL:sql];
	//recipesController.recipes = [self recipes];}
}

- (NSArray *)ingredientsForRecipe:(NSString *)recipeName {
	NSString *sql = [NSString stringWithFormat:@"SELECT ingredient_name FROM ingredient WHERE ingredient.recipe_id IN (SELECT recipe_id FROM recipe WHERE recipe_name = '%@') ORDER BY ingredient_order", recipeName];
	return [SQLiteAccess selectManyValuesWithSQL:sql];
}

- (void)removeIngredient:(NSString *)ingredient forRecipe:(NSString *)recipeName {
	NSString *sql = [NSString stringWithFormat:@"SELECT recipe_id FROM recipe WHERE recipe_name = '%@'", recipeName];
	NSString *recipe_id = [SQLiteAccess selectOneValueSQL:sql];
	sql = [NSString stringWithFormat:@"DELETE FROM ingredient WHERE recipe_id = %@ AND ingredient_name = '%@'", recipe_id, ingredient];
	[SQLiteAccess deleteWithSQL:sql];
	ingredientsController.ingredients = [self ingredientsForRecipe:recipeName];
}

- (void)addIngredient:(NSString *)ingredient forRecipe:(NSString *)recipe {
	NSString *sql = [NSString stringWithFormat:@"SELECT recipe_id FROM recipe WHERE recipe_name = '%@'", recipe];
	NSString *recipe_id = [SQLiteAccess selectOneValueSQL:sql];
	sql = [NSString stringWithFormat:@"SELECT MAX(ingredient_order) + 1 FROM ingredient WHERE recipe_id = %@", recipe_id];
	NSString *maxOrderId = [SQLiteAccess selectOneValueSQL:sql];
  if([NSNull null] == (id)maxOrderId || nil == maxOrderId) {
    maxOrderId = @"0";
  }
	sql = [NSString stringWithFormat:@"INSERT INTO ingredient (recipe_id, ingredient_order, ingredient_name) VALUES (%@, %@, '%@')", recipe_id, maxOrderId, ingredient];
	[SQLiteAccess insertWithSQL:sql];
	ingredientsController.ingredients = [self ingredientsForRecipe:recipe];
}

- (void) moveIngredientForRecipe:(NSString *)recipeName atIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
	NSString *sql = [NSString stringWithFormat:@"SELECT recipe_id FROM recipe WHERE recipe_name = '%@'", recipeName];
	NSString *recipeId = [SQLiteAccess selectOneValueSQL:sql];
	sql = [NSString stringWithFormat:@"SELECT ingredient_id, ingredient_order FROM ingredient WHERE recipe_id = %@ ORDER BY ingredient_order", recipeId];
	NSMutableArray *ingredients = [NSMutableArray arrayWithArray:[SQLiteAccess selectManyRowsWithSQL:sql]];
	NSDictionary *ingredient = [ingredients objectAtIndex:fromIndex];
	[ingredients removeObjectAtIndex:fromIndex];
	[ingredients insertObject:ingredient atIndex:toIndex];
	for(int i = 0;i < ingredients.count;i++) {
		NSString *ingredientId = [[ingredients objectAtIndex:i] valueForKey:@"ingredient_id"];
		sql = [NSString stringWithFormat:@"UPDATE ingredient SET ingredient_order = %d WHERE ingredient_id = %@", i, ingredientId];
		[SQLiteAccess updateWithSQL:sql];
	}
}

- (void)recipeClicked:(NSString *)recipeName {
	ingredientsController.ingredients = [self ingredientsForRecipe:recipeName];
	ingredientsController.title = recipeName;
	[navController pushViewController:ingredientsController animated:YES];
}

- (void)displayAddNewIngredientScreen:(NSString *)recipeName {
	addIngredientController.recipeName = recipeName;
	addIngredientController.title = @"New Ingredient";
	[navController pushViewController:addIngredientController animated:YES];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	navController.viewControllers = [NSArray arrayWithObject:recipesController];
	// Override point for customization after app launch	
    [window addSubview:navController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [recipesController release];
	[window release];
	[super dealloc];
}


@end
