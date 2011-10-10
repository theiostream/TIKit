//
//  TIKitAppDelegate.h
//  TIKit
//
//  Created by Daniel Ferreira on 08/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TIKitViewController;

@interface TIKitAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TIKitViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TIKitViewController *viewController;

@end

