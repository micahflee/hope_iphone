//
//  JSInterface.m
//  TheNextHOPE
//
//  Created by micah on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "JSInterface.h"


@implementation JSInterface

- (id) init {
	if((self = [super init])) {
		[self loadPrefs];
		lastDownloadedJSON = 0;
	}
	return self;
}

- (void) runCommand:(NSURL*)url webView:(UIWebView*)webView {
	NSString* returnValue = @"";
	NSString* host = [url host];
	NSString* path = [url path];
	
	// getScheduleJSON
	if([host compare:@"getScheduleJSON"] == NSOrderedSame) {
		NSLog(@"JSInterface getScheduleJSON");
		returnValue = [self getScheduleJSON];
		[self setReturnValue:returnValue webView:webView];
	}
	// getNoticeJSON
	else if([host compare:@"getNoticeJSON"] == NSOrderedSame) {
		NSLog(@"JSInterface getNoticeJSON");
		returnValue = [self getNoticeJSON];
		[self setReturnValue:returnValue webView:webView];
		NSLog(@"JSInterface return value is: %@", returnValue);
	}
	// getFavorites
	else if([host compare:@"getFavorites"] == NSOrderedSame) {
		NSLog(@"JSInterface getFavorites");
		returnValue = [self getFavorites];
		[self setReturnValue:returnValue webView:webView];
		NSLog(@"JSInterface return value is: %@", returnValue);
	}
	// saveFavorites
	else if([host compare:@"saveFavorites"] == NSOrderedSame) {
		NSLog(@"JSInterface saveFavorites");
	}
	// getFilter
	else if([host compare:@"getFilter"] == NSOrderedSame) {
		NSLog(@"JSInterface getFilter");
		returnValue = [self getFilter];
		[self setReturnValue:returnValue webView:webView];
		NSLog(@"JSInterface return value is: %@", returnValue);
	}
	// saveFilter
	else if([host compare:@"saveFilter"] == NSOrderedSame) {
		NSLog(@"JSInterface saveFilter");
	}
	// addToCalendar
	else if([host compare:@"addToCalendar"] == NSOrderedSame) {
		NSLog(@"JSInterface addToCalendar");
	}
	// haveCalendar
	else if([host compare:@"haveCalendar"] == NSOrderedSame) {
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
		prefJSON = [preferences objectAtIndex:0];
		prefFavorites = [preferences objectAtIndex:1];
		prefFilter = [preferences objectAtIndex:2];
	} else {
		NSLog(@"Create new Preferences file");
		prefJSON = @"{ }";
		prefFavorites = @"";
		prefFilter = @"all";
		[self savePrefs];
	}
}

- (void) savePrefs {
	NSLog(@"Saving Preferences");
	
	// initialize preferences
	preferences = [NSMutableArray arrayWithCapacity:3];
	[preferences addObject:prefJSON];
	[preferences addObject:prefFavorites];
	[preferences addObject:prefFilter];
	
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

- (NSString*) getFavorites {
	return prefFavorites;
}

- (void) saveFavorites:(NSString*)favorites {
	prefFavorites = favorites;
	[self savePrefs];
}

- (NSString*) getFilter {
	return prefFilter;
}

- (void) saveFilter:(NSString*)filter {
	prefFilter = filter;
	[self savePrefs];
}

- (void) addToCalendar:(NSString*)eventJson {
}

- (bool) haveCalendar {
	return FALSE;
}

@end
