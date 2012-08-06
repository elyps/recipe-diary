//
//  RecipesAppDelegate.m
//  Recipes
//
//  Created by Adam on 17/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RecipesAppDelegate.h"
#import "RecipesViewController.h"
#import "IngredientsViewController.h"
#import "AddIngredientViewController.h"

@implementation RecipesAppDelegate

@synthesize window;
@synthesize navController;
@synthesize recipesController;
@synthesize ingredientsController;
@synthesize addIngredientController;

- (NSArray *)recipes {
	return [data allKeys];
}

- (void)displayAddNewIngredientScreen:(NSString *)recipeName {
	addIngredientController.recipeName = recipeName;
	[navController pushViewController:addIngredientController animated:YES];
}

- (void)addRecipe:(NSString *)recipeName {
	[data setValue:[NSMutableArray array] forKey:recipeName];
}

- (void)removeRecipe:(NSString *)recipeName {
	[data removeObjectForKey:recipeName];
}

- (void)addIngredient:(NSString *)ingredientName forRecipe:(NSString *)recipe {
	[[data valueForKey:recipe] addObject:ingredientName];
}

- (void)removeIngredient:(NSString *)ingredientName forRecipe:(NSString *)recipe {
	[[data valueForKey:recipe] removeObject:ingredientName];
}

- (void)recipeClicked:(NSString *)recipeName {
	self.ingredientsController.ingredients = [data valueForKey:recipeName];
	self.ingredientsController.title = recipeName;
	[navController pushViewController:ingredientsController animated:YES];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	data = [[NSMutableDictionary dictionary] retain];
	[data setValue:[NSMutableArray arrayWithObjects:@"sugar",@"wheat",@"barley",nil] forKey:@"Beer"];
    navController.viewControllers = [NSArray arrayWithObject:recipesController];
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
	[navController release];
    [recipesController release];
	[ingredientsController release];
    [window release];
    [super dealloc];
}

@end
