//
//  RecipesViewController.m
//  Recipes
//
//  Created by Adam on 17/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RecipesViewController.h"
#import "AddRecipeViewController.h"
#import "RecipesAppDelegate.h"

@implementation RecipesViewController

- (void)addRecipe:(NSString *)recipeName {
	[appDelegate addRecipe:recipeName];
	[tableView reloadData];
}

- (void)addIngredient:(NSString *)ingredientName forRecipe:(NSString *)recipe {
	[appDelegate addIngredient:ingredientName forRecipe:recipe];
}

- (void)removeIngredient:(NSString *)ingredientName forRecipe:(NSString *)recipe {
	[appDelegate removeIngredient:ingredientName forRecipe:recipe];
}

- (void)moveIngredientForRecipe:(NSString *)recipeName atIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
	[appDelegate moveIngredientForRecipe:recipeName atIndex:fromIndex toIndex:toIndex ];
}

- (void)displayAddNewIngredientScreen:(NSString *)recipeName {
	[appDelegate displayAddNewIngredientScreen:recipeName];
}

- (IBAction)add:(id)sender {
	[self presentModalViewController:addRecipeController animated:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];
	[tableView setEditing:editing animated:animated];
}

- (void)tableView:(UITableView *)tv moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	
}

- (BOOL)tableView:(UITableView *)tv canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[appDelegate recipeClicked:[[tv cellForRowAtIndexPath:indexPath] textLabel].text];
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"recipeCell"];
	if(cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"recipeCell"] autorelease];
	}
	cell.textLabel.text = [appDelegate.recipes objectAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [appDelegate.recipes count];
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	UIBarButtonItem *addBtn = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)] autorelease];
	self.navigationItem.rightBarButtonItem = addBtn;
}

- (void)removeRecipe:(NSString *)recipeName {
	[appDelegate removeRecipe:recipeName];
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if ( editingStyle == UITableViewCellEditingStyleDelete ) {
		[self removeRecipe:[[tv cellForRowAtIndexPath:indexPath ] textLabel].text];
		[tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (void)viewDidAppear:(BOOL)animated {
	[tableView reloadData];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
