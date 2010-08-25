//
//  AWNotification.h
//  RoundedNotification
//
//  Created by Alex Wiltschko on 8/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#define kDefaultWidthRoundedCenterLarge 250.0
#define kDefaultHeightRoundedCenterLarge 250.0
#define kDefaultWidthRoundedThin 200.0f
#define kDefaultHeightRoundedThin 40.0

#define kFontSizePill 16
#define kFontSizeRoundedRect 20
#define kFontSizeFullScreen 18

#define kDefaultFont @"Helvetica Neue"

CGRect CGRectMakeCentered(CGRect containingRect, float width, float height);


typedef enum {
	AWNotificationStyleDimScreen,
	AWNotificationStyleRoundedRect,
	AWNotificationStylePill
} AWNotificationStyle;




@interface AWNotification : UIView {
	NSString *message;
	UILabel *messageLabel;
	UIActivityIndicatorView *spinner;
	AWNotificationStyle style;
	
	UIFont *font;

}

@property (nonatomic, retain, setter=setMessage:) NSString *message;

- (void)setMessage;
- (id)initWithNotificationStyle:(AWNotificationStyle)style;
- (void)show;
- (void)hide;
- (void)hideWithMessage:(NSString *)finalMessage; // use if you want to display a goodbye message, like "Success!" or "Upload complete!"
- (void)hideWithSuccessMessage:(NSString *)finalMessage;
- (void)hideWithFailureMessage:(NSString *)finalMessage;
@end
