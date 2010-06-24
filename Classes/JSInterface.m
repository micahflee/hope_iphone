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
		prefJSON = @"{ }";
		prefFavorites = @"";
		prefFilter = @"all";
		lastDownloadedJSON = 0;
	}
	return self;
}

- (NSString*) getScheduleJSON {
	return prefJSON;
}

- (NSString*) getFavorites {
	return prefFavorites;
}

- (void) saveFavorites:(NSString*)favorites {
}

- (NSString*) getFilter {
	return prefFilter;
}

- (void) saveFilter:(NSString*)filter {
}

@end
