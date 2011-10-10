/*
 *  TIAlertViewDelegate.h
 *  TIKit
 *
 *  Created by Daniel Ferreira on 08/10/11.
 *  Copyright 2011 __MyCompanyName__. All rights reserved.
 *
 */

@protocol TIAlertViewDelegate <NSObject>

// Confirming button -- IF ONE METHOD IS IMPLEMENTED ANOTHER ONE /MUST/ BE IMPLEMENTED TOO.
// -color... and -textFor... are optional.

- (BOOL)requireConfirmationForButtonForAlertView:(id)av;
- (int)buttonIndexForConfirmationForAlertView:(id)av;
- (UIColor *)colorForConfirmationButtonBackgroundForAlertView:(id)av;
- (NSString *)textForConfirmationButtonForAlertView:(id)av;

@end