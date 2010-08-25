//
//  AWNotification.h
//  RoundedNotification
//
//	Copyright (c) 2010 Alex Wiltschko
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.


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
	AWNotificationStyleFullScreen,
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
