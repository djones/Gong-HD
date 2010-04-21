//
//  AppDelegate_Pad.h
//  gong-hd
//
//  Created by David on 21/04/10.
//  Copyright Resolve Digital Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController_Pad;

@interface AppDelegate_Pad : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainViewController_Pad *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController_Pad *mainViewController;

@end

