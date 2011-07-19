//
//  MobileBrowserAppDelegate.h
//  MobileBrowser
//
//  Created by Raul Montero on 19/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MobileBrowserViewController;

@interface MobileBrowserAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MobileBrowserViewController *viewController;

@end
