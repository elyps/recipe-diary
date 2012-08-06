//
//  IngredientsViewController.m
//  Recipes
//
//  Created by Adam on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "IngredientsViewController.h"
#import "RecipesViewController.h"


@implementation IngredientsViewController

@synthesize ingredients;
@synthesize recipesController;

- (void)removeIngredient:(NSString *)ingredientName {
	[recipesController removeIngredient:ingredientName forRecipe:self.title];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ( indexPath.row < [self.ingredients count]) {
		return UITableViewCellEditingStyleDelete;		
	} else {
		return UITableViewCellEditingStyleInsert;
	}
	return UITableViewCellEditingStyleNone;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	if ( self.editing != editing ) {
		[super setEditing:editing animated:animated];
		[tableView setEditing:editing animated:animated];
		NSArray *indexPaths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:self.ingredients.count inSection:0]];
		if ( editing == YES ) {
			[tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
		} else {
			[tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];			
		}
	}
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.row < [self.ingredients count]) {
		[self removeIngredient:[[tv cellForRowAtIndexPath:indexPath ] textLabel].text];
		[tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
	
}

- (void)tableView:(UITableView *)tv moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	[recipesController moveIngredientForRecipe:self.title atIndex:fromIndexPath.row toIndex:toIndexPath.row ];
}

- (BOOL)tableView:(UITableView *)tv canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row < self.ingredients.count) {
		return YES;
	} else {
		return NO;
	}	
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
	if (proposedDestinationIndexPath.row == self.ingredients.count) {
		return [NSIndexPath indexPathForRow:self.ingredients.count-1 inSection:0];
	} else {
		return proposedDestinationIndexPath;
	}	
}

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == ingredients.count) {
		[recipesController displayAddNewIngredientScreen:self.title];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:@"ingredientsCell"];
	if ( cell == nil ) {
		cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:nil];
	}
	if (indexPath.row < self.ingredients.count) {
		cell.textLabel.text = [self.ingredients objectAtIndex:indexPath.row];
	} else {
		cell.textLabel.text = @"Add ingredient";
		cell.textLabel.textColor = [UIColor lightGrayColor];
		cell.hidesAccessoryWhenEditing = NO;
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSInteger count = self.ingredients.count;
	if ( self.editing )
	{
		count++;
	}
	return count;
}



/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
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

- (void)viewDidAppear:(BOOL)animated {
	[tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated {
	[self setEditing:NO animated:YES];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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