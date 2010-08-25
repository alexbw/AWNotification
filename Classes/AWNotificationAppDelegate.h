//
//  AWNotificationAppDelegate.h
//  AWNotification
//
//  Created by Alex Wiltschko on 8/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AWNotificationViewController;

@interface AWNotificationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AWNotificationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AWNotificationViewController *viewController;

@end

