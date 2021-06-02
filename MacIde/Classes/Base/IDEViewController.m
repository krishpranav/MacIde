//
//  IDEViewController.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEViewController.h"

static NSString * const __classSuffix               = @"Controller";
NSString * const IDEViewControllerException   = @"IDEViewControllerException";

@implementation IDEViewController

@synthesize popover = _popover;

- ( id )init
{
    NSString * className;
    NSString * nibName;
    
    className = NSStringFromClass( [ self class ] );
    
    if( [ className hasSuffix: __classSuffix ] == NO )
    {
        @throw [ NSException exceptionWithName: IDEViewControllerException reason: @"Invalid view controller class name" userInfo: nil ];
    }
    
    nibName = [ className substringToIndex: className.length - __classSuffix.length ];
    
    if( ( self = [ super initWithNibName: nibName bundle: nil ] ) )
    {}
    
    return self;
}

- ( void )dealloc
{
    if( _popover.shown == YES )
    {
        [ _popover close ];
    }
    
    RELEASE_IVAR( _popover );
    
    [ super dealloc ];
}

- ( void )openInPopoverRelativeToRect: ( NSRect )rect ofView: ( NSView * )view preferredEdge: ( NSRectEdge )edge
{
    if( _popover.shown == YES )
    {
        return;
    }
    
    RELEASE_IVAR( _popover );
    
    _popover                       = [ NSPopover new ];
    _popover.behavior              = NSPopoverBehaviorTransient;
    _popover.contentViewController = self;
    
    [ _popover showRelativeToRect: rect ofView: view preferredEdge: edge ];
}

- ( void )closePopover
{
    [ _popover close ];
    
    RELEASE_IVAR( _popover );
}


@end
