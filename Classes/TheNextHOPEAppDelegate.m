//
//  TheNextHOPEAppDelegate.m
//  TheNextHOPE
//
//  Created by micah on 6/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TheNextHOPEAppDelegate.h"

@implementation TheNextHOPEAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
