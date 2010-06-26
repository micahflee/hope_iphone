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
	UIWebView *hopeWebView;
	UIButton *buttonSchedule;
	UIButton *buttonFavorites;
	UIButton *buttonSearch;
	UIButton *buttonNotice;
	
	JSInterface *jsInterface;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIWebView *hopeWebView;
@property (nonatomic, retain) IBOutlet UIButton *buttonSchedule;
@property (nonatomic, retain) IBOutlet UIButton *buttonFavorites;
@property (nonatomic, retain) IBOutlet UIButton *buttonSearch;
@property (nonatomic, retain) IBOutlet UIButton *buttonNotice;

- (IBAction) doButtonSchedule;
- (IBAction) doButtonFavorites;
- (IBAction) doButtonSearch;
- (IBAction) doButtonNotice;

@end

