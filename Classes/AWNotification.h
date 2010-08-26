//
//  AWNotification.h
//  AWNotification
//
//  Created by Alex Wiltschko on 8/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AWNotificationView.h"

@interface AWNotification : UIViewController {
	AWNotificationView *notificationView;
}

- (void)initWithNotificationStyle:(AWNotificationStyle)style;

@end
