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

#import "Locator.h"
#import "SynthesizeSingleton.h"
#import "NSObject+Extension.h"

@interface Locator ()

@property(nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic, assign) id<LocatorDelegate> delegate;
@property(nonatomic, retain) NSString *latitude;
@property(nonatomic, retain) NSString *longitude;
@end

@implementation Locator

@synthesize delegate, locationManager, latitude, longitude;

SYNTHESIZE_SINGLETON_FOR_CLASS(Locator);

- (id) init {
	if ((self = [super init])) {
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.delegate = self;
		self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
	}
	return self;
}

- (void)dealloc {
	delegate = nil;
	[locationManager release];
	[latitude release];
	[longitude release];
	[super dealloc];
}

- (void)detectLocationForDelegate:(id<LocatorDelegate>)theDelegate {
	self.delegate = theDelegate;
	if (self.latitude != nil && self.longitude != nil) {
		[self dispatchSelector:@selector(locator:latitude:longitude:)
						target:self.delegate 
					   objects:self, self.latitude, self.longitude, nil];	
	}
	[locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    if (abs([newLocation.timestamp timeIntervalSinceNow]) < 15.0) {
		self.latitude = [NSString stringWithFormat:@"%.6f", newLocation.coordinate.latitude];
		self.longitude = [NSString stringWithFormat:@"%.6f", newLocation.coordinate.longitude];
        [self dispatchSelector:@selector(locator:latitude:longitude:)
						target:self.delegate 
					   objects:self, self.latitude, self.longitude, nil];
		[self.locationManager stopUpdatingLocation];
    }
}

@end
