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

#import <Foundation/Foundation.h>

@class TextTableCell;
@class SubtitleTableCell;
@class TextFieldTableCell;
@class TextViewTableCell;
@class TextViewTableCell;
@class BooleanTableCell;
@class CheckBoxTableCell;
@class ImageTableCell;
@class MapTableCell;
@class DateTableCell;
@class DeploymentTableCell;
@class IncidentTableCell;
@class SliderTableCell;

@protocol TextTableCellDelegate;
@protocol SearchTableCellDelegate;
@protocol TextFieldTableCellDelegate;
@protocol TextViewTableCellDelegate;
@protocol BooleanTableCellDelegate;
@protocol CheckBoxTableCellDelegate;
@protocol MapTableCellDelegate;
@protocol DateTableCellDelegate;
@protocol SliderTableCellDelegate;

@interface TableCellFactory : NSObject {

}

+ (DeploymentTableCell *) getDeploymentTableCellForTable:(UITableView *)tableView 
											   indexPath:(NSIndexPath *)indexPath;

+ (IncidentTableCell *) getIncidentTableCellForTable:(UITableView *)tableView 
										   indexPath:(NSIndexPath *)indexPath;

+ (UITableViewCell *) getDefaultTableCellForTable:(UITableView *)tableView 
										indexPath:(NSIndexPath *)indexPath;

+ (SubtitleTableCell *) getSubtitleTableCellWithDefaultImage:(UIImage *)defaultImage 
													   table:(UITableView *)tableView 
												   indexPath:(NSIndexPath *)indexPath;

+ (TextTableCell *) getTextTableCellForTable:(UITableView *)tableView 
								   indexPath:(NSIndexPath *)indexPath;

+ (SliderTableCell *) getSliderTableCellForDelegate:(id<SliderTableCellDelegate>)delegate 
											  table:(UITableView *)tableView 
										  indexPath:(NSIndexPath *)indexPath;

+ (TextFieldTableCell *) getTextFieldTableCellForDelegate:(id<TextFieldTableCellDelegate>)delegate
													table:(UITableView *)tableView 
												indexPath:(NSIndexPath *)indexPath;

+ (TextViewTableCell *) getTextViewTableCellForDelegate:(id<TextViewTableCellDelegate>)delegate
												  table:(UITableView *)tableView 
											  indexPath:(NSIndexPath *)indexPath;

+ (BooleanTableCell *) getBooleanTableCellForDelegate:(id<BooleanTableCellDelegate>)delegate
												table:(UITableView *)tableView 
											indexPath:(NSIndexPath *)indexPath;

+ (CheckBoxTableCell *) getCheckBoxTableCellForDelegate:(id<CheckBoxTableCellDelegate>)delegate
												  table:(UITableView *)tableView 
											  indexPath:(NSIndexPath *)indexPath;

+ (ImageTableCell *) getImageTableCellWithImage:(UIImage *)image 
										  table:(UITableView *)tableView
									  indexPath:(NSIndexPath *)indexPath;

+ (MapTableCell *) getMapTableCellForDelegate:(id<MapTableCellDelegate>)delegate
										table:(UITableView *)tableView 
									indexPath:(NSIndexPath *)indexPath;

+ (DateTableCell *) getDateTableCellForDelegate:(id<DateTableCellDelegate>)delegate
										  table:(UITableView *)tableView
									  indexPath:(NSIndexPath *)indexPath;

@end
