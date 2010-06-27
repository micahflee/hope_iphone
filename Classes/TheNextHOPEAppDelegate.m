//
//  TheNextHOPEAppDelegate.m
//  TheNextHOPE
//
//  Created by micah on 6/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TheNextHOPEAppDelegate.h"

@implementation TheNextHOPEAppDelegate

@synthesize window, hopeWebView, buttonSchedule, buttonFavorites, buttonSearch, buttonNotice;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// start the javascript interface
	jsInterface = [[JSInterface alloc] init];
	
	// initialize the web view
	[hopeWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"html"]isDirectory:NO]]];
	
	// attach the tab bar controller and launch
	[window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
	[window release];
	[jsInterface release];
	[super dealloc];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSURL *url = [request URL];
	NSLog(@"Intercepting a request: %@", [url absoluteString]);
	
	// if it's a hope:// url, then it's trying to run some obj-c code
	if([[url scheme] isEqualToString:@"hope"]) {
		[jsInterface runCommand:url webView:webView];
		return NO;
	}
	
	return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	NSLog(@"%s", [error localizedDescription]);
}

- (IBAction) doButtonSchedule {
	[hopeWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"html"]isDirectory:NO]]];
}

- (IBAction) doButtonFavorites {
	[hopeWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"favorites" ofType:@"html"]isDirectory:NO]]];
}

- (IBAction) doButtonSearch {
}

- (IBAction) doButtonNotice {
	[hopeWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"notice" ofType:@"html"]isDirectory:NO]]];
}

@end
