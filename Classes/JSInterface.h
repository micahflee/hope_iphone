//
//  JSInterface.h
//  TheNextHOPE
//
//  Created by micah on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCHEDULE_JSON_URL @"http://www.thenexthope.org/hope_schedule/json.php"
#define NOTICE_JSON_URL @"http://www.thenexthope.org/hope_schedule/notice_json.php"

@interface JSInterface : NSObject {
	NSMutableArray* preferences;
	NSString* _json;
	NSString* _favorites;
	NSString* _filter;
	NSTimeInterval lastDownloadedJson;
}

@property (nonatomic, copy) NSString* filter;
@property (nonatomic, copy) NSString* favorites;
@property (nonatomic, copy) NSString* json;

- (void) alert:(NSString*)message;

- (void) runCommand:(NSURL*)url webView:(UIWebView*)webView;
- (void) setReturnValue:(NSString*)val webView:(UIWebView*)webView;

- (NSString*)getPrefsPath;
- (void) loadPrefs;
- (void) savePrefs;

- (NSString*) getScheduleJson:(bool)forceDownload;
- (NSString*) getNoticeJson;

@end
