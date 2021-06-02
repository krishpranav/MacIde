//
//  IDETableView.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDETableView.h"

@implementation IDETableView

- ( void )keyDown: ( NSEvent * )e
{
    id < IDETableViewDelegate > delegate;
    
    delegate = nil;
    
    if( [ self.delegate conformsToProtocol: @protocol( IDETableViewDelegate ) ] )
    {
        delegate = ( id < IDETableViewDelegate > )( self.delegate );
    }
    
    if( self.selectedRow != -1 )
    {
        if( [ delegate respondsToSelector: @selector( tableView:processKeyEvent:onRow:event: ) ] )
        {
            if( [ delegate tableView: self processKeyEvent: e.keyCode onRow: self.selectedRow event: e ] == YES )
            {
                return;
            }
        }
    }
    
    [ super keyDown: e ];
}

- ( void )mouseDown: ( NSEvent * )e
{
    NSPoint                     point;
    NSInteger                   row;
    NSInteger                   column;
    CGRect                      frame;
    id < IDETableViewDelegate >  delegate;
    
    point       = [ self convertPoint: [ e locationInWindow ] fromView: nil ];
    row         = [ self rowAtPoint: point ];
    column      = [ self columnAtPoint: point ];
    frame       = [ self frameOfCellAtColumn: column row: row ];
    delegate    = nil;
    
    if( row == NSNotFound )
    {
        [ super mouseDown: e ];
        
        return;
    }
    
    point.x = point.x - frame.origin.x;
    point.y = point.y - frame.origin.y;
    
    if( [ self.delegate conformsToProtocol: @protocol( IDETableViewDelegate ) ] )
    {
        delegate = ( id < IDETableViewDelegate > )( self.delegate );
    }
    
    if( e.clickCount == 2 )
    {
        if( [ delegate respondsToSelector: @selector( tableView:shouldDoubleClickOnRow:atPoint:event: ) ] )
        {
            if( [ delegate tableView: self shouldDoubleClickOnRow: row atPoint: point event: e ] == NO )
            {
                return;
            }
        }
        
        if( [ delegate respondsToSelector: @selector( tableView:willDoubleClickOnRow:atPoint:event: ) ] )
        {
            [ delegate tableView: self willDoubleClickOnRow: row atPoint: point event: e ];
        }
        
        if( [ delegate respondsToSelector: @selector( tableView:didDoubleClickOnRow:atPoint:event: ) ] )
        {
            [ delegate tableView: self didDoubleClickOnRow: row atPoint: point event: e ];
        }
        else
        {
            [ super mouseDown: e ];
        }
    }
    else
    {
        if( [ delegate respondsToSelector: @selector( tableView:shouldClickOnRow:atPoint:event: ) ] )
        {
            if( [ delegate tableView: self shouldClickOnRow: row atPoint: point event: e ] == NO )
            {
                return;
            }
        }
        
        if( [ delegate respondsToSelector: @selector( tableView:willClickOnRow:atPoint:event: ) ] )
        {
            [ delegate tableView: self willClickOnRow: row atPoint: point event: e ];
        }
        
        if( [ delegate respondsToSelector: @selector( tableView:didClickOnRow:atPoint:event: ) ] )
        {
            [ delegate tableView: self didClickOnRow: row atPoint: point event: e ];
        }
        else
        {
            [ super mouseDown: e ];
        }
    }
}

@end
