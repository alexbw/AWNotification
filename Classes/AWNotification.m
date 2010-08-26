    //
//  AWNotification.m
//  AWNotification
//
//  Created by Alex Wiltschko on 8/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AWNotification.h"


@implementation AWNotification


- (void)initWithNotificationStyle:(AWNotificationStyle)style
{
	notificationView = [[AWNotificationView alloc] initWithNotificationStyle:style];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}
*/

- (void)dealloc {
	[notficationView release];
    [super dealloc];
}


@end
