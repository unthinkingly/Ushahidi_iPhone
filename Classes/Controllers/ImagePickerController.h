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

@protocol ImagePickerDelegate;

@interface ImagePickerController : NSObject<UINavigationControllerDelegate,
											UIImagePickerControllerDelegate,
											UIActionSheetDelegate,
											UIPopoverControllerDelegate> {
@public
	UIViewController *viewController;
	UIPopoverController *popoverController;
	id<ImagePickerDelegate> delegate;
												
@private
	CGFloat width;
}

@property(nonatomic, retain) UIViewController *viewController;
@property(nonatomic, retain) UIPopoverController *popoverController;
@property(nonatomic, assign) id<ImagePickerDelegate> delegate;

- (id) initWithController:(UIViewController *)controller;
- (void) showImagePickerForDelegate:(id<ImagePickerDelegate>)delegate;
- (void) showImagePickerForDelegate:(id<ImagePickerDelegate>)delegate width:(CGFloat)width;

@end

@protocol ImagePickerDelegate <NSObject>

@optional

- (void) imagePickerDidCancel:(ImagePickerController *)imagePicker;
- (void) imagePickerDidSelect:(ImagePickerController *)imagePicker;
- (void) imagePickerDidFinish:(ImagePickerController *)imagePicker image:(UIImage *)image;

@end