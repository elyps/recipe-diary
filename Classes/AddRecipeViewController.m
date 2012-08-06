//
//  AddRecipesViewController.m
//  Recipes
//
//  Created by Adam on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AddRecipeViewController.h"
#import "RecipesViewController.h"

@implementation AddRecipeViewController

- (IBAction)save:(id)sender {
	[self addRecipe];
}

- (IBAction)cancel:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)tf {
	[self addRecipe];
}

- (void)addRecipe {
	if (textField.text.length > 0) {
		[recipesController addRecipe:textField.text];
		[self dismissModalViewControllerAnimated:YES];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	textField.text = @"";
	[self setEditing:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
	[textField becomeFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)tf {
	[textField resignFirstResponder];
	return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
	if ( cell == nil ) {
		cell = textFieldCell;
	}
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
