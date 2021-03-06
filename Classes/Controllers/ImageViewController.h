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

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class Email;

@interface ImageViewController : BaseViewController {
	
@public
	UIImageView *imageView;
	UIImage *image;
	NSArray *images;
	UISegmentedControl *nextPrevious;
	
@private
	Email *email;
	
}

@property(nonatomic, retain) IBOutlet UIImageView *imageView;
@property(nonatomic, retain) UIImage *image;
@property(nonatomic, retain) NSArray *images;
@property(nonatomic, retain) IBOutlet UISegmentedControl *nextPrevious;

- (IBAction) nextPrevious:(id)sender;
- (IBAction) emailPhoto:(id)sender;
- (IBAction) savePhoto:(id)sender;

@end
