//
//  FlipsideViewController.h
//  gong-hd
//
//  Created by David on 21/04/10.
//  Copyright 2010 Resolve Digital Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController_Pad : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController_Pad *)controller;
@end

