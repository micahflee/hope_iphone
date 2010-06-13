//
//  TheNextHOPEAppDelegate.m
//  TheNextHOPE
//
//  Created by micah on 6/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TheNextHOPEAppDelegate.h"

@implementation TheNextHOPEAppDelegate

@synthesize window, tabBarController, webViewSchedule, webViewFavorites, webViewTwitter;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	/*// initialize the web views
	[webViewFavorites loadHTMLString:@"favorites.html" baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath]]];
	[webViewTwitter loadHTMLString:@"twitter.html" baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath]]];
	[webViewSchedule loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"html"]isDirectory:NO]]];*/
	
	// attach the tab bar controller and launch
	[window addSubview:[tabBarController view]];
	[window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
	[tabBarController release];
	[window release];
	[super dealloc];
}


@end
