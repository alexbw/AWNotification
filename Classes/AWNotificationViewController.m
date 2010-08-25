//
//  AWNotificationViewController.m
//  AWNotification
//
//  Created by Alex Wiltschko on 8/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AWNotificationViewController.h"

@implementation AWNotificationViewController


- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	notification = [[AWNotification alloc] initWithNotificationStyle:AWNotificationStyleRoundedRect];
	notification.message = @"Trying really hard...";
	[notification show];
	
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[notification hideWithFailureMessage:@"D'oh!"];
}

- (void)dealloc {
    [super dealloc];
	[notification release];
}

@end
