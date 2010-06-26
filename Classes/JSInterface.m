//
//  JSInterface.m
//  TheNextHOPE
//
//  Created by micah on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "JSInterface.h"


@implementation JSInterface

@synthesize filter = _filter;
@synthesize favorites = _favorites;
@synthesize json = _json;

- (id) init {
	if((self = [super init])) {
		[self loadPrefs];
		lastDownloadedJSON = 0;
	}
	return self;
}

- (void)dealloc {
	[_filter release];
	[_favorites release];
	[_json release];
	[super dealloc];
}

- (void) runCommand:(NSURL*)url webView:(UIWebView*)webView {
	NSString* returnValue = @"";
	NSString* host = [url host];
	//NSString* path = [url path];
	
	// getScheduleJSON
	if([host isEqualToString:@"getScheduleJSON"]) {
		NSLog(@"JSInterface getScheduleJSON");
		returnValue = [self getScheduleJSON];
		[self setReturnValue:returnValue webView:webView];
	}
	// getNoticeJSON
	else if([host isEqualToString:@"getNoticeJSON"]) {
		NSLog(@"JSInterface getNoticeJSON");
		returnValue = [self getNoticeJSON];
		[self setReturnValue:returnValue webView:webView];
		NSLog(@"JSInterface return value is: %@", returnValue);
	}
	// getFavorites
	else if([host isEqualToString:@"getFavorites"]) {
		NSLog(@"JSInterface getFavorites");
		returnValue = self.favorites;
		[self setReturnValue:returnValue webView:webView];
		NSLog(@"JSInterface return value is: %@", returnValue);
	}
	// saveFavorites
	else if([host isEqualToString:@"saveFavorites"]) {
		NSLog(@"JSInterface saveFavorites");
	}
	// getFilter
	else if([host isEqualToString:@"getFilter"]) {
		NSLog(@"JSInterface getFilter");
		returnValue = self.filter;
		[self setReturnValue:returnValue webView:webView];
		NSLog(@"JSInterface return value is: %@", returnValue);
	}
	// saveFilter
	else if([host isEqualToString:@"saveFilter"]) {
		NSLog(@"JSInterface saveFilter");
	}
	// addToCalendar
	else if([host isEqualToString:@"addToCalendar"]) {
		NSLog(@"JSInterface addToCalendar");
	}
	// haveCalendar
	else if([host isEqualToString:@"haveCalendar"]) {
		NSLog(@"JSInterface haveCalendar");
	}
	// invalid command
	else {
		NSLog(@"JSInterface Invalid command: %@", host);
	}
}

- (void) setReturnValue:(NSString*)val webView:(UIWebView*)webView {
	NSString* str = [NSString stringWithFormat:@"JSInterface.returnValue = '%@';", val];
	[webView stringByEvaluatingJavaScriptFromString:str];
}

- (NSString*)getPrefsPath {
	NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"Preferences.plist"];
}

- (void) loadPrefs {
	if([[NSFileManager defaultManager] fileExistsAtPath:[self getPrefsPath]]) {
		NSLog(@"Loading Preferences");
		preferences = [NSMutableArray arrayWithContentsOfFile:[self getPrefsPath]];
		self.json = [preferences objectAtIndex:0];
		self.favorites = [preferences objectAtIndex:1];
		self.filter = [preferences objectAtIndex:2];
	} else {
		NSLog(@"Create new Preferences file");
		self.json = @"{ }";
		self.favorites = @"";
		self.filter = @"all";
		[self savePrefs];
	}
}

- (void) savePrefs {
	NSLog(@"Saving Preferences");
	
	// initialize preferences
	preferences = [NSMutableArray arrayWithCapacity:3];
	[preferences addObject:self.json];
	[preferences addObject:self.favorites];
	[preferences addObject:self.filter];
	
	// save to file
	[preferences writeToFile:[self getPrefsPath] atomically:YES];
}

- (NSString*) getScheduleJSON {
	return @"{ test : true }";
	//return prefJSON;
}

- (NSString*) getNoticeJSON {
	return @"{ }";
}


- (void) addToCalendar:(NSString*)eventJson {
}

- (BOOL) haveCalendar {
	return FALSE;
}

@end
