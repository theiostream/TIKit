//
//  TIAlertView.h
//  TIKit
//
//  Created by Daniel Ferreira on 08/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#import "UIAlertView2.h"
#import "TIAlertViewDelegate.h"

#define TIAlertViewPopupDialogAnimation 0
#define TIAlertViewUndoDialogAnimation 1

@interface TIAlertView : UIAlertView {
	id <TIAlertViewDelegate> delegate;
	
	UIWebView *_webView;
}
- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle message:(NSString *)message taglineText:(NSString *)taglineText delegate:(id)dl animation:(int)animation cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle message:(NSString *)message textFieldPromptText:(NSString *)tfpt taglineText:(NSString *)taglineText delegate:(id)dl animation:(int)animation cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle webViewURL:(NSURL *)url taglineText:(NSString *)taglineText delegate:(id)dl animation:(int)animation cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
- (void)addWebViewWithURL:(NSURL *)url;
// For tableviews inside alertviews check out this amazing project: https://github.com/simonb/SBTableAlert

@end
