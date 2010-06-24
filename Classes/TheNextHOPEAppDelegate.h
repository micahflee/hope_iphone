//
//  TheNextHOPEAppDelegate.h
//  TheNextHOPE
//
//  Created by micah on 6/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSInterface.h"

@interface TheNextHOPEAppDelegate : NSObject <UIApplicationDelegate, UIWebViewDelegate> {
	UIWindow *window;
	UITabBarController *tabBarController;
	UIWebView *webViewSchedule;
	UIWebView *webViewFavorites;
	
	JSInterface *jsInterface;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UIWebView *webViewSchedule;
@property (nonatomic, retain) IBOutlet UIWebView *webViewFavorites;

- (void) setReturnValue:(NSString*)val webView:(UIWebView*)webView;

@end

