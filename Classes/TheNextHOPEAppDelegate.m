//
//  TheNextHOPEAppDelegate.m
//  TheNextHOPE
//
//  Created by micah on 6/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TheNextHOPEAppDelegate.h"

@implementation TheNextHOPEAppDelegate

@synthesize window, tabBarController, webViewSchedule, webViewFavorites;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// start the javascript interface
	jsInterface = [[JSInterface alloc] init];
	
	// initialize the web view
	[webViewSchedule loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"html"]isDirectory:NO]]];
	[webViewFavorites loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"favorites" ofType:@"html"]isDirectory:NO]]];
	
	// attach the tab bar controller and launch
	[window addSubview:[tabBarController view]];
	[window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
	[tabBarController release];
	[window release];
	[jsInterface release];
	[super dealloc];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSURL *url = [request URL];
	NSString* returnValue;
	
	// if it's a hope:// url, then it's trying to run some obj-c code
	if([[url scheme] isEqualToString:@"hope"]) {
		// is it a command?
		NSString* host = [url host];
		if(host == @"getScheduleJSON") {
			returnValue = [jsInterface getScheduleJSON];
			[self setReturnValue:returnValue webView:webView];
		} else if(host == @"getFavorites") {
			returnValue = [jsInterface getFavorites];
			[self setReturnValue:returnValue webView:webView];
		} else if(host == @"saveFavorites") {
		} else if(host == @"getFilter") {
			returnValue = [jsInterface getFilter];
			[self setReturnValue:returnValue webView:webView];
		} else if(host == @"saveFilter") {
		}
		return NO;
	}
	return YES;
}

- (void) setReturnValue:(NSString*)val webView:(UIWebView*)webView {
	NSString* str = [NSString stringWithFormat:@"window.JSInterface.returnValue = '%s';", val];
	[webView stringByEvaluatingJavaScriptFromString:str];
}

@end
