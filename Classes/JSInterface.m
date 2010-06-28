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
		lastDownloadedJson = 0;
	}
	return self;
}

- (void)dealloc {
	[_filter release];
	[_favorites release];
	[_json release];
	[super dealloc];
}

- (void) alert:(NSString*)message {
	UIAlertView* alert = [[UIAlertView alloc]
						  initWithTitle:@"The Next HOPE"
						  message:message 
						  delegate:nil
						  cancelButtonTitle:@"Ok" 
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void) runCommand:(NSURL*)url webView:(UIWebView*)webView {
	NSString* returnValue = @"";
	NSString* host = [url host];
	NSString* path = [url path];
	if([path length] > 0)
		path = [path substringFromIndex:1]; // remove beginning /
	
	// getScheduleJson
	if([host isEqualToString:@"getScheduleJson"]) {
		NSLog(@"JSInterface getScheduleJson");
		bool argument;
		if([path isEqualToString:@"true"])
			argument = true;
		else
			argument = false;
		returnValue = [self getScheduleJson:argument];
		[self setReturnValue:returnValue webView:webView];
	}
	// getNoticeJson
	else if([host isEqualToString:@"getNoticeJson"]) {
		NSLog(@"JSInterface getNoticeJson");
		returnValue = [self getNoticeJson];
		[self setReturnValue:returnValue webView:webView];
	}
	// getFavorites
	else if([host isEqualToString:@"getFavorites"]) {
		NSLog(@"JSInterface getFavorites");
		returnValue = self.favorites;
		[self setReturnValue:returnValue webView:webView];
	}
	// saveFavorites
	else if([host isEqualToString:@"saveFavorites"]) {
		NSLog(@"JSInterface saveFavorites");
		self.favorites = path;
		[self savePrefs];
	}
	// getFilter
	else if([host isEqualToString:@"getFilter"]) {
		NSLog(@"JSInterface getFilter");
		returnValue = self.filter;
		[self setReturnValue:returnValue webView:webView];
	}
	// saveFilter
	else if([host isEqualToString:@"saveFilter"]) {
		NSLog(@"JSInterface saveFilter");
		self.filter = path;
		[self savePrefs];
	}
	// addToCalendar
	else if([host isEqualToString:@"addToCalendar"]) {
		NSLog(@"JSInterface addToCalendar");
	}
	// haveCalendar
	else if([host isEqualToString:@"haveCalendar"]) {
		NSLog(@"JSInterface haveCalendar");
		if([self haveCalendar])
			returnValue = @"true";
		else
			returnValue = @"false";
		[self setReturnValue:returnValue webView:webView];
	}
	// invalid command
	else {
		NSLog(@"JSInterface Invalid command: %@", host);
	}
}

- (void) setReturnValue:(NSString*)val webView:(UIWebView*)webView {
	// first, fix up val
	val = [val stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"]; // backslashes
	val = [val stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]; // newlines
	val = [val stringByReplacingOccurrencesOfString:@"'" withString:@"\\'"]; // single quotes
	
	// return it
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

- (NSString*) getScheduleJson:(bool)forceDownload {
	// if it's been less than 1 hour since the last json pull, just return the stored value
	if(!forceDownload) {
		NSTimeInterval timeDiff = [[NSDate date] timeIntervalSince1970] - lastDownloadedJson;
		if(timeDiff < 3600) {
			return self.json;
		}
	}
	
	// try downloading file
	NSURL* url = [NSURL URLWithString:SCHEDULE_JSON_URL];
	NSString* scheduleJson = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:NULL];
	lastDownloadedJson = [[NSDate date] timeIntervalSince1970];
	if(scheduleJson == nil) {
		// failed to download so lets return what we got
		if([self.json isEqualToString:@"{ }"]) {
			[self alert:@"Could not download schedule, check your internet connection"];
		} else {
			[self alert:@"Using stored schedule"];
		}
		return self.json;
	}
	
	// downloaded new json successfully, now save it and return it
	self.json = [NSString stringWithString:scheduleJson];
	[self savePrefs];
	[self alert:@"Downloaded latest schedule"];
	return self.json;
}

- (NSString*) getNoticeJson {
	NSURL* url = [NSURL URLWithString:NOTICE_JSON_URL];
	NSString* noticeJson = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:NULL];
	if(noticeJson == nil)
		return @"{ \"didNotLoad\" : true }";
	return noticeJson;
}

- (void) addToCalendar:(NSString*)eventJson {
}

- (BOOL) haveCalendar {
	return FALSE;
}

@end
