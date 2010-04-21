//
//  AppDelegate_Phone.h
//  gong-hd
//
//  Created by David on 21/04/10.
//  Copyright Resolve Digital Ltd 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController_Phone;

@interface AppDelegate_Phone : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainViewController_Phone *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController_Phone *mainViewController;

@end

