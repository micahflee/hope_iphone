//
//  JSInterface.h
//  TheNextHOPE
//
//  Created by micah on 6/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JSInterface : NSObject {
	NSString* prefJSON;
	NSString* prefFavorites;
	NSString* prefFilter;
	float lastDownloadedJSON;
}

- (NSString*) getScheduleJSON;
- (NSString*) getFavorites;
- (void) saveFavorites:(NSString*)favorites;
- (NSString*) getFilter;
- (void) saveFilter:(NSString*)filter;

@end
