//
//  JSInterface.h
//  TheNextHOPE
//
//  Created by micah on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCHEDULE_Json_URL @"http://www.thenexthope.org/hope_schedule/json.php";
#define NOTICE_Json_URL @"http://www.thenexthope.org/hope_schedule/notice_json.php";

@interface JSInterface : NSObject {
	NSMutableArray* preferences;
	NSString* _json;
	NSString* _favorites;
	NSString* _filter;
	float lastDownloadedJson;
}

@property (nonatomic, copy) NSString* filter;
@property (nonatomic, copy) NSString* favorites;
@property (nonatomic, copy) NSString* json;

- (void) runCommand:(NSURL*)url webView:(UIWebView*)webView;
- (void) setReturnValue:(NSString*)val webView:(UIWebView*)webView;

- (NSString*)getPrefsPath;
- (void) loadPrefs;
- (void) savePrefs;

- (NSString*) getScheduleJson;
- (NSString*) getNoticeJson;

- (void) addToCalendar:(NSString*)eventJson;
- (BOOL) haveCalendar;

@end
