//
//  main.m
//  TIKit
//  Subclasses from UIKit; with private methods et al.
//
//  Created by Daniel Ferreira on 08/10/11.
//  Copyright 2011 Matoe Productions LLC. All rights reserved.
//
//  Licensed under WeAmDev License v2 (  http://matoe.co.cc/license.txt )
//  

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
