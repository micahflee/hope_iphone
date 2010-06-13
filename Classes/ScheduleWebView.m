//
//  ScheduleWebView.m
//  TheNextHOPE
//
//  Created by micah on 6/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ScheduleWebView.h"


@implementation ScheduleWebView

- (id) initWithFrame:(CGRect)frame {
	if((self = [super initWithFrame:frame])) {
		NSLog(@"ScheduleWebView init");
		[self loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"html"]isDirectory:NO]]];
	}
	return self;
}

@end
