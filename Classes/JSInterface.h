//
//  JSInterface.h
//  TheNextHOPE
//
//  Created by micah on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCHEDULE_JSON_URL @"http://www.thenexthope.org/hope_schedule/json.php";
#define NOTICE_JSON_URL @"http://www.thenexthope.org/hope_schedule/notice_json.php";

@interface JSInterface : NSObject {
	NSMutableArray* preferences;
	NSString* prefJSON;
	NSString* prefFavorites;
	NSString* prefFilter;
	float lastDownloadedJSON;
}

- (void) runCommand:(NSURL*)url webView:(UIWebView*)webView;
- (void) setReturnValue:(NSString*)val webView:(UIWebView*)webView;

- (NSString*)getPrefsPath;
- (void) loadPrefs;
- (void) savePrefs;

- (NSString*) getScheduleJSON;
- (NSString*) getNoticeJSON;
- (NSString*) getFavorites;
- (void) saveFavorites:(NSString*)favorites;
- (NSString*) getFilter;
- (void) saveFilter:(NSString*)filter;
- (void) addToCalendar:(NSString*)eventJson;
- (bool) haveCalendar;

@end
