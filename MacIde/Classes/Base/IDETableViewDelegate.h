//
//  IDETableViewDelegate.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

@class IDETableView;

@protocol IDETableViewDelegate< NSTableViewDelegate >

@optional

- ( BOOL )tableView: ( IDETableView * )view shouldClickOnRow: ( NSInteger )row atPoint: ( NSPoint )point event: ( NSEvent * )e;
- ( void )tableView: ( IDETableView * )view willClickOnRow: ( NSInteger )row atPoint: ( NSPoint )point event: ( NSEvent * )e;
- ( void )tableView: ( IDETableView * )view didClickOnRow: ( NSInteger )row atPoint: ( NSPoint )point event: ( NSEvent * )e;
- ( BOOL )tableView: ( IDETableView * )view shouldDoubleClickOnRow: ( NSInteger )row atPoint: ( NSPoint )point event: ( NSEvent * )e;
- ( void )tableView: ( IDETableView * )view willDoubleClickOnRow: ( NSInteger )row atPoint: ( NSPoint )point event: ( NSEvent * )e;
- ( void )tableView: ( IDETableView * )view didDoubleClickOnRow: ( NSInteger )row atPoint: ( NSPoint )point event: ( NSEvent * )e;
- ( BOOL )tableView: ( IDETableView * )view processKeyEvent: ( IDEVirtualKey )key onRow: ( NSInteger )row event: ( NSEvent * )e;

@end
