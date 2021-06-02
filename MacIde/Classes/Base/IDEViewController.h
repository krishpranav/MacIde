//
//  IDEViewController.h
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

FOUNDATION_EXPORT NSString * const IDEViewControllerException;

@interface IDEViewController: NSViewController
{
@protected
    
    NSView    * _currentView;
    NSPopover * _popover;
    
@private
    
    RESERVED_IVARS( IDEViewController , 5 );
}

@property( atomic, readonly ) NSPopover * popover;

- ( void )openInPopoverRelativeToRect: ( NSRect )rect ofView: ( NSView * )view preferredEdge: ( NSRectEdge )edge;
- ( void )closePopover;

@end
