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

#import "TableCellFactory.h"
#import "UIColor+Extension.h"
#import "TextTableCell.h"
#import "SubtitleTableCell.h"
#import "TextFieldTableCell.h"
#import "TextViewTableCell.h"
#import "BooleanTableCell.h"
#import "CheckBoxTableCell.h"
#import "ImageTableCell.h"
#import "MapTableCell.h"
#import "DateTableCell.h"
#import "DeploymentTableCell.h"
#import "IncidentTableCell.h"
#import "SliderTableCell.h"
#import "Device.h"

@interface TableCellFactory ()

+ (UITableViewCell *) getTableViewCellFromNib:(NSString *)nibName;

@end

@implementation TableCellFactory

+ (UITableViewCell *) getTableViewCellFromNib:(NSString *)nibName {
	NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
	for (id currentObject in topLevelObjects) {
		if ([currentObject isKindOfClass:[UITableViewCell class]]) {
			return (UITableViewCell *)currentObject;
		}
	}
	return nil;
}

#pragma mark -
#pragma mark DeploymentTableCell

+ (DeploymentTableCell *) getDeploymentTableCellForTable:(UITableView *)tableView 
											   indexPath:(NSIndexPath *)indexPath {
	DeploymentTableCell *cell = (DeploymentTableCell *)[tableView dequeueReusableCellWithIdentifier:@"DeploymentTableCell"];
	if (cell == nil) {
		cell = (DeploymentTableCell *)[TableCellFactory getTableViewCellFromNib:@"DeploymentTableCell"];
		[cell setSelectedColor:[UIColor ushahidiDarkBrown]];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark IncidentTableCell

+ (IncidentTableCell *) getIncidentTableCellForTable:(UITableView *)tableView 
										   indexPath:(NSIndexPath *)indexPath {
	IncidentTableCell *cell = (IncidentTableCell *)[tableView dequeueReusableCellWithIdentifier:@"IncidentTableCell"];
	if (cell == nil) {
		NSString *nibName = [Device isIPad] ? @"IncidentTableCell_iPad" : @"IncidentTableCell_iPhone";
		cell = (IncidentTableCell *)[TableCellFactory getTableViewCellFromNib:nibName];
		[cell setSelectedColor:[UIColor ushahidiDarkBrown]];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark UITableViewCell

+ (UITableViewCell *) getDefaultTableCellForTable:(UITableView *)tableView 
										indexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
	}
	cell.accessoryType = UITableViewCellAccessoryNone;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}

#pragma mark -
#pragma mark TextTableCell

+ (TextTableCell *) getTextTableCellForTable:(UITableView *)tableView 
								   indexPath:(NSIndexPath *)indexPath {
	TextTableCell *cell = (TextTableCell *)[tableView dequeueReusableCellWithIdentifier:@"TextTableCell"];
	if (cell == nil) {
		cell = [[TextTableCell alloc] initWithReuseIdentifier:@"TextTableCell"];
		[cell setSelectedColor:[UIColor ushahidiDarkBrown]];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark SubtitleTableCell

+ (SubtitleTableCell *) getSubtitleTableCellWithDefaultImage:(UIImage *)defaultImage 
													   table:(UITableView *)tableView 
												   indexPath:(NSIndexPath *)indexPath {
	SubtitleTableCell *cell = (SubtitleTableCell *)[tableView dequeueReusableCellWithIdentifier:@"SubtitleTableCell"];
	if (cell == nil) {
		cell = [[[SubtitleTableCell alloc] initWithDefaultImage:defaultImage reuseIdentifier:@"SubtitleTableCell"] autorelease];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark SliderTableCell

+ (SliderTableCell *) getSliderTableCellForDelegate:(id<SliderTableCellDelegate>)delegate
											  table:(UITableView *)tableView 
										  indexPath:(NSIndexPath *)indexPath  {
	SliderTableCell *cell = (SliderTableCell *)[tableView dequeueReusableCellWithIdentifier:@"SliderTableCell"];
	if (cell == nil) {
		cell = [[[SliderTableCell alloc] initForDelegate:delegate reuseIdentifier:@"SliderTableCell"] autorelease];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark TextFieldTableCell

+ (TextFieldTableCell *) getTextFieldTableCellForDelegate:(id<TextFieldTableCellDelegate>)delegate
													 table:(UITableView *)tableView 
												indexPath:(NSIndexPath *)indexPath {
	TextFieldTableCell *cell = (TextFieldTableCell *)[tableView dequeueReusableCellWithIdentifier:@"TextFieldTableCell"];
	if (cell == nil) {
		cell = [[[TextFieldTableCell alloc] initForDelegate:delegate reuseIdentifier:@"TextFieldTableCell"] autorelease];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark TextViewTableCell

+ (TextViewTableCell *) getTextViewTableCellForDelegate:(id<TextViewTableCellDelegate>)delegate
												  table:(UITableView *)tableView 
											  indexPath:(NSIndexPath *)indexPath {
	TextViewTableCell *cell = (TextViewTableCell *)[tableView dequeueReusableCellWithIdentifier:@"TextViewTableCell"];
	if (cell == nil) {
		cell = [[[TextViewTableCell alloc] initForDelegate:delegate reuseIdentifier:@"TextViewTableCell"] autorelease];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark BooleanTableCell

+ (BooleanTableCell *) getBooleanTableCellForDelegate:(id<BooleanTableCellDelegate>)delegate
												table:(UITableView *)tableView 
											indexPath:(NSIndexPath *)indexPath {
	BooleanTableCell *cell = (BooleanTableCell *)[tableView dequeueReusableCellWithIdentifier:@"BooleanTableCell"];
	if (cell == nil) {
		cell = [[[BooleanTableCell alloc] initForDelegate:delegate reuseIdentifier:@"BooleanTableCell"] autorelease];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark CheckBoxTableCell

+ (CheckBoxTableCell *) getCheckBoxTableCellForDelegate:(id<CheckBoxTableCellDelegate>)delegate
												  table:(UITableView *)tableView 
											  indexPath:(NSIndexPath *)indexPath {
	CheckBoxTableCell *cell = (CheckBoxTableCell *)[tableView dequeueReusableCellWithIdentifier:@"CheckBoxTableCell"];
	if (cell == nil) {
		cell = [[[CheckBoxTableCell alloc] initForDelegate:delegate reuseIdentifier:@"CheckBoxTableCell"] autorelease];
		cell.checkedImage = [UIImage imageNamed:@"selected.png"];
		cell.uncheckedImage = [UIImage imageNamed:@"unselected.png"];
		[cell setSelectedColor:[UIColor ushahidiDarkBrown]];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark ImageTableCell

+ (ImageTableCell *) getImageTableCellWithImage:(UIImage *)image 
										  table:(UITableView *)tableView 
									  indexPath:(NSIndexPath *)indexPath {
	ImageTableCell *cell = (ImageTableCell *)[tableView dequeueReusableCellWithIdentifier:@"ImageTableCell"];
	if (cell == nil) {
		cell = [[[ImageTableCell alloc] initWithImage:image reuseIdentifier:@"ImageTableCell"] autorelease];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark MapTableCell

+ (MapTableCell *) getMapTableCellForDelegate:(id<MapTableCellDelegate>)delegate
										table:(UITableView *)tableView 
									indexPath:(NSIndexPath *)indexPath {
	MapTableCell *cell = (MapTableCell *)[tableView dequeueReusableCellWithIdentifier:@"MapTableCell"];
	if (cell == nil) {
		cell = [[[MapTableCell alloc] initForDelegate:delegate reuseIdentifier:@"MapTableCell"] autorelease];
	}
	cell.indexPath = indexPath;
	return cell;
}

#pragma mark -
#pragma mark MapTableCell

+ (DateTableCell *) getDateTableCellForDelegate:(id<DateTableCellDelegate>)delegate
										  table:(UITableView *)tableView 
									  indexPath:(NSIndexPath *)indexPath {
	DateTableCell *cell = (DateTableCell *)[tableView dequeueReusableCellWithIdentifier:@"DateTableCell"];
	if (cell == nil) {
		cell = [[[DateTableCell alloc] initForDelegate:delegate reuseIdentifier:@"DateTableCell"] autorelease];
	}
	cell.indexPath = indexPath;
	return cell;
}

@end
