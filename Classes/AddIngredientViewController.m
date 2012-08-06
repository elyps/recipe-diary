//
//  AddIngredientViewController.m
//  Recipes
//
//  Created by Adam on 19/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RecipesViewController.h"
#import "IngredientsViewController.h"
#import "AddIngredientViewController.h"

@implementation AddIngredientViewController

@synthesize recipesController;
@synthesize ingredientsController;
@synthesize recipeName;


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];
	if (editing == NO) {
		[(UINavigationController *)self.parentViewController popViewControllerAnimated:YES];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	textField.text = @"";
	[self setEditing:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
	[textField becomeFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)tf {
	if (tf.text.length > 0) {
		[recipesController addIngredient:tf.text forRecipe:self.recipeName];
	}
	[self setEditing:NO animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)tf {
	[textField resignFirstResponder];
	return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
	if ( cell == nil ) {
		cell = textFieldCell;
	}
	return cell;
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
