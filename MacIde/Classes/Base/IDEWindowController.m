//
//  IDEWindowController.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEWindowController.h"

static NSString * const __classSuffix               = @"Controller";
NSString * const IDEWindowControllerException = @"IDEWindowControllerException";

@implementation IDEWindowController


- ( id )init
{
    NSString * className;
    NSString * nibName;
    
    className = NSStringFromClass( [ self class ] );
    
    if( [ className hasSuffix: __classSuffix ] == NO )
    {
        @throw [ NSException exceptionWithName: IDEWindowControllerException reason: @"Invalid window controller class name" userInfo: nil ];
    }
    
    nibName = [ className substringToIndex: className.length - __classSuffix.length ];
    
    if( ( self = [ super initWithWindowNibName: nibName owner: self ] ) )
    {
        [ NOTIFICATION_CENTER addObserver: self selector: @selector( windowWillClose: ) name: NSWindowWillCloseNotification object: nil ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ NOTIFICATION_CENTER removeObserver: self ];
    
    [ super dealloc ];
}

- ( BOOL )releaseOnWindowClose
{
    @synchronized( self )
    {
        return _releaseOnWindowClose;
    }
}

- ( void )setReleaseOnWindowClose: ( BOOL )release
{
    @synchronized( self )
    {
        if( release == YES && _releaseOnWindowClose == NO )
        {
            [ self retain ];
        }
        else if( release == NO &&  _releaseOnWindowClose == YES )
        {
            [ self release ];
        }
        
        _releaseOnWindowClose = release;
    }
}

@end
