//
//  TIKitViewController.m
//  TIKit
//
//  Created by Daniel Ferreira on 08/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TIKitViewController.h"
#import "TIAlertView.h"

@implementation TIKitViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
	
	TIAlertView *av3 = [[TIAlertView alloc] initWithTitle:@"asd" subtitle:@"SUBTITLE" webViewURL:[NSURL URLWithString:@"http://www.google.com"] taglineText:@"asd" delegate:self animation:TIAlertViewUndoDialogAnimation cancelButtonTitle:@"hey" otherButtonTitles:nil];
	// [av3 setMessage:@"lorem ipsum dolor sit amet jajsjddsncjdsbcbdschdsbcj"];
	av3.tag = 1998;
	// [av show];
	// [av2 show];
	[av3 show];
}

// must pass implementation arg1 as TIAlertView* as the user will most likely use tag as a key comparison tool.
// id contains no @property tag. And casting everything is also boring.
- (BOOL)requireConfirmationForButtonForAlertView:(TIAlertView *)av {
	return YES;
}

- (int)buttonIndexForConfirmationForAlertView:(TIAlertView *)av {
	return 0;
}

- (UIColor *)colorForConfirmationButtonBackgroundForAlertView:(TIAlertView *)av {
	if ([av tag] == 1998)
		return [UIColor redColor];
	else if ([av tag] == 1996) return [UIColor greenColor];
	
	return [UIColor clearColor];

}

- (NSString *)textForConfirmationButtonForAlertView:(TIAlertView *)av {
	return @"Confirm?";
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ([alertView tag] == 1996) NSLog(@"It's av2!");
	else if ([alertView tag] == 1998) NSLog(@"It's teh av1!");
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
