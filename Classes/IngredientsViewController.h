//
//  IngredientsViewController.h
//  Recipes
//
//  Created by Adam on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecipesViewController;

@interface IngredientsViewController : UIViewController <UITableViewDataSource> {
	NSArray *ingredients;
	IBOutlet UITableView *tableView;
	IBOutlet RecipesViewController *recipesController;
}

@property (nonatomic, retain) NSArray *ingredients;
@property (nonatomic, retain) RecipesViewController *recipesController;

@end
