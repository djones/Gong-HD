//
//  AppDelegate_Phone.m
//  gong-hd
//
//  Created by David on 21/04/10.
//  Copyright Resolve Digital Ltd 2010. All rights reserved.
//

#import "AppDelegate_Phone.h"
#import "MainViewController_Phone.h"

@implementation AppDelegate_Phone

@synthesize window;
@synthesize mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // Override point for customization after application launch
	application.statusBarStyle = UIStatusBarStyleBlackOpaque;
	
	MainViewController_Phone *aController = [[MainViewController_Phone alloc] initWithNibName:@"MainView_Phone" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
	
	NSLog(@"got here");
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
