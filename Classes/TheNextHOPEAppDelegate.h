//
//  TheNextHOPEAppDelegate.h
//  TheNextHOPE
//
//  Created by micah on 6/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScheduleWebView;
@class FavoritesWebView;
@class TwitterWebView;

@interface TheNextHOPEAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UITabBarController *tabBarController;
	ScheduleWebView *webViewSchedule;
	FavoritesWebView *webViewFavorites;
	TwitterWebView *webViewTwitter;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet ScheduleWebView *webViewSchedule;
@property (nonatomic, retain) IBOutlet FavoritesWebView *webViewFavorites;
@property (nonatomic, retain) IBOutlet TwitterWebView *webViewTwitter;

@end

