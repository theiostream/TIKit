//
//  TIAlertView.m
//  TIKit
//
//  Created by Daniel Ferreira on 08/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  CREDITS:
//  @rpetrich -> very useful help with the type-two-times button

#import "TIAlertView.h"

BOOL ranThrough = NO;
BOOL isTabled = NO;

@implementation TIAlertView

- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle message:(NSString *)message taglineText:(NSString *)taglineText delegate:(id)dl animation:(int)animation cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
	va_list args;
	va_start(args, otherButtonTitles);
	
	self = [super initWithTitle:title message:message delegate:dl cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
	
	for (NSString *arg = otherButtonTitles; arg!=nil; arg = va_arg(args, NSString*)) {
		[self addButtonWithTitle:arg];
	}
	va_end(args);
	
	[self setTaglineText:taglineText];
	[self setSubtitle:subtitle];
	[self showWithAnimationType:animation];
	
	return self;
}

- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle message:(NSString *)message textFieldPromptText:(NSString *)tfpt taglineText:(NSString *)taglineText delegate:(id)dl animation:(int)animation cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
	va_list args;
	va_start(args, otherButtonTitles);
	
	self = [super initWithTitle:title message:message delegate:dl cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
	
	for (NSString *arg = otherButtonTitles; arg!=nil; arg = va_arg(args, NSString*)) {
		[self addButtonWithTitle:arg];
	}
	va_end(args);
	
	[self setTaglineText:taglineText];
	[self setSubtitle:subtitle];
	[self showWithAnimationType:animation];
	
	[self addTextFieldWithValue:nil label:tfpt];
	
	return self;
}

- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle webViewURL:(NSURL *)url taglineText:(NSString *)taglineText delegate:(id)dl animation:(int)animation cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
	self = [super initWithTitle:title message:@"\n\n\n\n\n\n\n\n\n\n" delegate:dl cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
		
	va_list args;
	va_start(args, otherButtonTitles);
	
	for (NSString *arg = otherButtonTitles; arg!=nil; arg = va_arg(args, NSString*)) {
		[self addButtonWithTitle:arg];
	}
	va_end(args);
	
	[self setSubtitle:subtitle];
	[self setTaglineText:taglineText];
	[self showWithAnimationType:animation];
	
	[self addWebViewWithURL:url];
	
	return self;
}

- (void)addWebViewWithURL:(NSURL *)url {

	CGRect frame;
	if ([self subtitle] != nil) frame = CGRectMake(12.0, 65.0, 260.0, 220.0);
	else frame = CGRectMake(12.0, 40.0, 260.0, 230.0);
	
	_webView = [[UIWebView alloc] initWithFrame:frame];
	[[_webView layer] setCornerRadius:10];
	[_webView setClipsToBounds:YES];
	
	[self addSubview:_webView];
	
	[_webView loadRequest:[NSURLRequest requestWithURL:url]];
}
	
- (void)_buttonClicked:(UIButton *)clicked {
	// clicked.tag = 234;
	// Apple uses tag as way to pass index on delegate method -alertView:clickedButtonAtIndex: -_-
	
	int index = 0;
	
	if ([[self delegate] respondsToSelector:@selector(requireConfirmationForButtonForAlertView:)]&&[[self delegate] requireConfirmationForButtonForAlertView:self]) {
		
		for (int i=0; i<[self buttonCount]; i++) {
			if ([[self buttonAtIndex:i] tag] == [clicked tag]) {
				index = i;
				break;
			}
		}
		
		NSLog(@"Button Index for Confirmation: %i; index is %i", [[self delegate] buttonIndexForConfirmationForAlertView:self], index);
		
		if (index == [[self delegate] buttonIndexForConfirmationForAlertView:self]) {
			if (!ranThrough) {
				ranThrough = YES;
				if ([[self delegate] respondsToSelector:@selector(colorForConfirmationButtonBackgroundForAlertView:)])
					[[self buttonAtIndex:index] setBackgroundColor:[[self delegate] colorForConfirmationButtonBackgroundForAlertView:self]];
				
				if ([[self delegate] respondsToSelector:@selector(textForConfirmationButtonForAlertView:)])
					 [[self buttonAtIndex:index] setTitle:[[self delegate] textForConfirmationButtonForAlertView:self]];
				
				return; 
			}
			else { ranThrough = NO; [super _buttonClicked:clicked]; }
		}
		
		else { [super _buttonClicked:clicked]; }
	}
	
	else { [super _buttonClicked:clicked]; }
}

- (void)dealloc {
	[_webView release];
	[super dealloc];

}

@end
