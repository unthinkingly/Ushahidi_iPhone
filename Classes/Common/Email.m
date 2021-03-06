/*****************************************************************************
 ** Copyright (c) 2010 Ushahidi Inc
 ** All rights reserved
 ** Contact: team@ushahidi.com
 ** Website: http://www.ushahidi.com
 **
 ** GNU Lesser General Public License Usage
 ** This file may be used under the terms of the GNU Lesser
 ** General Public License version 3 as published by the Free Software
 ** Foundation and appearing in the file LICENSE.LGPL included in the
 ** packaging of this file. Please review the following information to
 ** ensure the GNU Lesser General Public License version 3 requirements
 ** will be met: http://www.gnu.org/licenses/lgpl.html.
 **
 **
 ** If you have questions regarding the use of this file, please contact
 ** Ushahidi developers at team@ushahidi.com.
 **
 *****************************************************************************/

#import "Email.h"

@interface Email ()

@end 

@implementation Email

@synthesize controller, alert;

- (id) initWithController:(UIViewController *)theController {
	if (self = [super init]) {
		self.controller = theController;
		self.alert = [[AlertView alloc] initWithController:theController];
	}
    return self;
}

- (void)dealloc {
	[controller release];
	[alert release];
	[super dealloc];
}

- (void)sendMessage:(NSString *)message withSubject:(NSString *)subject {
	[self sendMessage:message withSubject:subject photos:nil];
}

- (void)sendMessage:(NSString *)message withSubject:(NSString *)subject photos:(NSArray *)photos {
	DLog(@"message:%@ withSubject:%@ photos:%d", message, subject, [photos count]);
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	[picker setMessageBody:message isHTML:YES];
	[picker setSubject:subject];
	if (photos != nil) {
		NSInteger index = 1;
		for(UIImage *image in photos) {
			NSData *imageData = UIImageJPEGRepresentation(image, 1);
			[picker addAttachmentData:imageData 
							 mimeType:@"image/jpg" 
							 fileName:[NSString stringWithFormat:@"photo%d.jpg", index]];
		}
		index++;
	}
	[self.controller presentModalViewController:picker animated:YES];
	[picker release];
}

- (void)mailComposeController:(MFMailComposeViewController*)theController didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	DLog(@"result:%d", result);
	if (error) {
		[self.alert showWithTitle:@"Error" andMessage:[[error userInfo] objectForKey:NSLocalizedDescriptionKey]];
	}
	else if (result == MFMailComposeResultSent) {
		
	}
	else if (result == MFMailComposeResultCancelled) {
		
	}
	[theController dismissModalViewControllerAnimated:YES];
}

@end
