//
//  AppDelegate_Pad.m
//  gong-hd
//
//  Created by David on 21/04/10.
//  Copyright Resolve Digital Ltd 2010. All rights reserved.
//

#import "AppDelegate_Pad.h"
#import "MainViewController_Pad.h"

@implementation AppDelegate_Pad

@synthesize window;
@synthesize mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	application.statusBarStyle = UIStatusBarStyleBlackOpaque;
	
    // Override point for customization after application launch
	MainViewController_Pad *aController = [[MainViewController_Pad alloc] initWithNibName:@"MainView_Pad" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}


@end
