//
//  AWNotification.m
//  RoundedNotification
//
//  Created by Alex Wiltschko on 8/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AWNotification.h"

@implementation AWNotification
@synthesize message;

- (void)dealloc
{
	if (willNeedToTurnOffOrientationNotifications) {
		[[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
	}
	
	[font release];	
	[super dealloc];
}

- (id)initWithNotificationStyle:(AWNotificationStyle)newStyle {

		CGRect frame;
		style = newStyle;
	
		self.userInteractionEnabled = NO;
		
		switch (style) {
			case AWNotificationStyleFullScreen:
				
				frame = [[UIScreen mainScreen] bounds];
				font = [UIFont fontWithName:kDefaultFont size:kFontSizeFullScreen];
				
				if (self = [super initWithFrame:frame]) {
				
					self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
					self.alpha = 0.85;
					
					CGRect labelFrame = CGRectMakeCentered(frame, frame.size.width*0.75, frame.size.height*0.4);
					labelFrame.origin.y += 75.0f;
					messageLabel = [[UILabel alloc] initWithFrame:labelFrame];
					messageLabel.text = @"Hold on...";
					messageLabel.font = font;
					messageLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1.0];
					messageLabel.numberOfLines = 3;
					messageLabel.backgroundColor = [UIColor clearColor];
					messageLabel.textAlignment = UITextAlignmentCenter;
					[messageLabel setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin | 
					 UIViewAutoresizingFlexibleLeftMargin |
					 UIViewAutoresizingFlexibleTopMargin |
					 UIViewAutoresizingFlexibleBottomMargin ];
					
					[self addSubview:messageLabel];
					
					spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
					[spinner setCenter:CGPointMake(frame.size.width/2.0f, frame.size.height/2.0)];
					[spinner setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin | 
					 UIViewAutoresizingFlexibleLeftMargin |
					 UIViewAutoresizingFlexibleTopMargin |
					 UIViewAutoresizingFlexibleBottomMargin];
					
					[self addSubview:spinner];
					
					[self setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin |
					 UIViewAutoresizingFlexibleLeftMargin |
					 UIViewAutoresizingFlexibleTopMargin |
					 UIViewAutoresizingFlexibleBottomMargin |
					 UIViewAutoresizingFlexibleWidth |
					 UIViewAutoresizingFlexibleHeight ];
					
					
				}				
				
				break;
			case AWNotificationStyleRoundedRect:
				
				frame = CGRectMakeCentered([[UIScreen mainScreen] bounds], kDefaultWidthRoundedCenterLarge, kDefaultHeightRoundedCenterLarge);
				font = [UIFont fontWithName:kDefaultFont size:kFontSizeRoundedRect];
				
				if (self = [super initWithFrame:frame]) {
				
					self.backgroundColor = [UIColor clearColor];
					
					self.layer.cornerRadius = 20;
					self.layer.backgroundColor = [[UIColor colorWithWhite:0 alpha:0.85] CGColor];
					self.layer.opacity = 0.5;
					
					CGRect labelFrame = CGRectMakeCentered(frame, frame.size.width*0.85, frame.size.height*0.3);
					labelFrame.origin.y = frame.size.height*0.75;

					messageLabel = [[UILabel alloc] initWithFrame:labelFrame];
					messageLabel.text = @"Hold on...";
					messageLabel.font = font;
					messageLabel.textColor = [UIColor whiteColor];
					messageLabel.numberOfLines = 3;
					messageLabel.backgroundColor = [UIColor clearColor];
					messageLabel.textAlignment = UITextAlignmentCenter;
					[messageLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin];
					
					[self addSubview:messageLabel];
					
					spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
					[spinner setCenter:CGPointMake(frame.size.width/2.0f, frame.size.height/2.0f)];
					[spinner setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin];

					[self addSubview:spinner];
					
					[self setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin |
					 UIViewAutoresizingFlexibleLeftMargin |
					 UIViewAutoresizingFlexibleTopMargin |
					 UIViewAutoresizingFlexibleBottomMargin];
					
				
				}
					
				break;
					
				
				
			case AWNotificationStylePill:
				
				frame = CGRectMakeCentered([[UIScreen mainScreen] bounds], kDefaultWidthRoundedThin, kDefaultHeightRoundedThin);
				font = [UIFont fontWithName:kDefaultFont size:kFontSizePill];
				
				if (self = [super initWithFrame:frame]) {
				
					self.backgroundColor = [UIColor clearColor];
					
					self.layer.cornerRadius = 20;
					self.layer.backgroundColor = [[UIColor colorWithWhite:0.2 alpha:0.85] CGColor];
					self.layer.opacity = 0.5;
					
					float xOffset = 45.0f;
					float fontsize = kFontSizePill;
					CGRect labelFrame = CGRectMake(xOffset, frame.size.height/2.0 - fontsize/2.0, kDefaultWidthRoundedThin - xOffset, frame.size.height/2.0);
					messageLabel = [[UILabel alloc] initWithFrame:labelFrame];
					messageLabel.text = @"Hold on...";
					messageLabel.font = font;
					messageLabel.textColor = [UIColor whiteColor];
					messageLabel.numberOfLines = 1;
					messageLabel.backgroundColor = [UIColor clearColor];
					messageLabel.textAlignment = UITextAlignmentLeft;
					messageLabel.lineBreakMode = UILineBreakModeClip;
					messageLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
					[messageLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin];
					
					[self addSubview:messageLabel];
					
					spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
					[spinner setCenter:CGPointMake(22.0, frame.size.height/2.0)];
					[spinner setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin];
					 
					
					[self addSubview:spinner];
					
					[self setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin |
					 UIViewAutoresizingFlexibleLeftMargin |
					 UIViewAutoresizingFlexibleTopMargin |
					 UIViewAutoresizingFlexibleBottomMargin];
					
				
				
				}
				
				break;
				
		}
	
	self.autoresizesSubviews = YES;
	
	self.hidden = YES;
    
    return self;
}

- (void)setMessage:(NSString *)newMessage
{
	
	message = newMessage;
	messageLabel.text = message;
	
	if (style == AWNotificationStylePill) { // then we're going to resize the message box

		CGSize newLabelSize = [message sizeWithFont:messageLabel.font];		
		CGRect newFrame = CGRectMakeCentered([[UIScreen mainScreen] bounds], 
											 newLabelSize.width + messageLabel.frame.origin.x + 20.0, 
											 kDefaultHeightRoundedThin);

		
		[UIView animateWithDuration:0.25
							  delay:0.0 
							options:UIViewAnimationCurveEaseInOut 
						 animations:^{
							 self.frame = newFrame;
						 }
						 completion:^(BOOL done){
							
						 } ];
	}
	
	
}

- (void)show

{
	self.hidden = NO;
	float destAlpha = self.alpha;	
	self.alpha = 0.0;
	
	[[[[UIApplication sharedApplication] windows] objectAtIndex:0] addSubview:self];
	
	[UIView animateWithDuration:0.5 
						  delay:0.0 
						options:UIViewAnimationCurveEaseInOut 
					 animations:^{
						 self.alpha = destAlpha;
					 }
					 completion:^(BOOL done){

					 }];
	
	if (![[UIDevice currentDevice] isGeneratingDeviceOrientationNotifications]) {
		[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
		willNeedToTurnOffOrientationNotifications = YES;
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(rotate)
												name:@"UIDeviceOrientationDidChangeNotification" 
											   object:nil];
																
	
	
}

- (void)rotate
{
	UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
		
	CGAffineTransform transform;
	
	switch (orientation) {
		case UIDeviceOrientationLandscapeLeft:
			transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI / 2.0);
			break;
		case UIDeviceOrientationLandscapeRight:
			transform = CGAffineTransformRotate(CGAffineTransformIdentity, -M_PI / 2.0);			
			break;
		case UIDeviceOrientationPortrait:
			transform = CGAffineTransformIdentity;
			break;
			
		case UIDeviceOrientationPortraitUpsideDown:
			transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);						
			break;
	}
	
	self.transform = transform;

	if (style == AWNotificationStyleFullScreen) {
		if (UIDeviceOrientationIsPortrait(orientation)) {
			self.frame = [[UIScreen mainScreen] bounds];
		}
		else if (UIDeviceOrientationIsLandscape(orientation)) {
			CGRect newFrame = [[UIScreen mainScreen] bounds];
			float newheight = newFrame.size.width;
//			newFrame.size.width =  newFrame.size.height;
//			newFrame.size.height = newheight;
			newFrame.origin.x = 0;
			newFrame.origin.y = 0;
			self.frame = newFrame;
			
		}
	}
	
	
}


- (void)hide
{
		
	[UIView animateWithDuration:0.5 
						  delay:0.0 
						options:UIViewAnimationCurveEaseInOut 
					 animations:^{
						 self.alpha = 0.0;
					 }
					 completion:^(BOOL done){
						 self.hidden = YES;
						 [self removeFromSuperview];
					 }];
	
}

- (void)hideWithMessage:(NSString *)finalMessage
{
	self.message = finalMessage;
	messageLabel.textColor = [UIColor whiteColor];
	
	[UIView animateWithDuration:0.75 
						  delay:1.25 
						options:UIViewAnimationCurveEaseInOut 
					 animations:^{
						 self.alpha = 0.0;

					 }
					 completion:^(BOOL done){
						 self.hidden = YES;
						 [self removeFromSuperview];
					 }];
	
}

- (void)hideWithSuccessMessage:(NSString *)finalMessage
{
	// Stop the spinner and add a checkmark
	[spinner stopAnimating];
	UIImageView *checkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check.png"]];
	checkImageView.frame = spinner.frame;
	[self addSubview:checkImageView];
	[checkImageView release];
	
	[self hideWithMessage:finalMessage];
}

- (void)hideWithFailureMessage:(NSString *)finalMessage
{
	// Stop the spinner and add an "x" image
	[spinner stopAnimating];
	UIImageView *xImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"x.png"]];
	xImageView.frame = spinner.frame;
	[self addSubview:xImageView];
	[xImageView release];
	
	[self hideWithMessage:finalMessage];
}


 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
	 [spinner startAnimating];
	 messageLabel.text = message;
 }
				   

CGRect CGRectMakeCentered(CGRect containingRect, float width, float height)
{
	float x = containingRect.size.width/2.0 - width/2.0;
	float y = containingRect.size.height/2.0 - height/2.0;
	
	return CGRectMake(x, y, width, height);
		
}


				   

@end
