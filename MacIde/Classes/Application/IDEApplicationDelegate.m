//
//  IDEApplicationDelegate.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

// imports
#import "IDEApplicationDelegate.h"
#import "IDEApplicationDelegate+Private.h"
#import "IDEApplicationDelegate+NSOpenSavePanelDelegate.h"
#import "IDEMainWindowController.h"
#import "IDEPreferencesWindowController.h"
#import "IDEAboutWindowController.h"
#import "IDEAlternateAboutWindowController.h"
#import "IDEPreferences.h"
#import "IDEDocument.h"
#import "IDERegistrationWindowController.h"

@implementation IDEApplicationDelegate

@synthesize activeMainWindowController = _activeMainWindowController;

+ ( CEApplicationDelegate * )sharedInstance
{
    return ( IDEApplicationDelegate * )( APPLICATION.delegate );
}

- ( id )init
{
    if( ( self = [ super init ] ) )
    {
        [ IDEPreferences sharedInstance ];
        [ self installApplicationSupportFiles ];
        [ self firstLaunch ];
        
        _mainWindowControllers = [ [ NSMutableArray alloc ] initWithCapacity: 10 ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ NOTIFICATION_CENTER removeObserver: self ];
    
    RELEASE_IVAR( _mainWindowControllers );
    RELEASE_IVAR( _preferencesWindowController );
    RELEASE_IVAR( _aboutWindowController );
    RELEASE_IVAR( _alternateAboutWindowController );
    RELEASE_IVAR( _activeMainWindowController );
    
    [ super dealloc ];
}

- ( void )applicationDidFinishLaunching: ( NSNotification * )notification
{
    ( void )notification;
    
    [ IDEPreferences sharedInstance ];
    [ self installApplicationSupportFiles ];
    [ self firstLaunch ];
    
    [ NOTIFICATION_CENTER addObserver: self selector: @selector( windowDidClose: )     name: NSWindowWillCloseNotification    object: nil ];
    [ NOTIFICATION_CENTER addObserver: self selector: @selector( windowDidBecomeKey: ) name: NSWindowDidBecomeKeyNotification object: nil ];
    
    if( _mainWindowControllers.count == 0 )
    {
        [ self newWindow: nil ];
    }
}

- ( void )applicationWillTerminate: ( NSNotification * )notification
{
    ( void )notification;
    
    [ [ IDEPreferences sharedInstance ] setFirstLaunch: NO ];
}

- ( IBAction )showPreferencesWindow: ( id )sender
{
    ( void )sender;
    
    if( _preferencesWindowController == nil )
    {
        _preferencesWindowController = [ IDEPreferencesWindowController new ];
    }
    
    [ APPLICATION runModalForWindow: _preferencesWindowController.window ];
}

- ( IBAction )showAboutWindow: ( id )sender
{
    if( _aboutWindowController == nil )
    {
        _aboutWindowController = [ IDEAboutWindowController new ];
    }
    
    [ _aboutWindowController.window center ];
    [ _aboutWindowController showWindow: sender ];
    [ _aboutWindowController.window makeKeyAndOrderFront: sender ];
}

- ( IBAction )showAlternateAboutWindow: ( id )sender
{
    if( _alternateAboutWindowController == nil )
    {
        _alternateAboutWindowController = [ IDEAlternateAboutWindowController new ];
    }
    
    [ _alternateAboutWindowController.window center ];
    [ _alternateAboutWindowController showWindow: sender ];
    [ _alternateAboutWindowController.window makeKeyAndOrderFront: sender ];
}

- ( IBAction )showRegistrationWindow: ( id )sender
{
    ( void )sender;
    
    if( _registrationWindowController == nil )
    {
        _registrationWindowController = [ IDERegistrationWindowController new ];
    }
    
    [ _registrationWindowController.window center ];
    [ APPLICATION runModalForWindow: _registrationWindowController.window ];
}

- ( IBAction )newWindow: ( id )sender
{
    CEMainWindowController * controller;
    
    controller = [ CEMainWindowController new ];
    
    [ _mainWindowControllers addObject: controller ];
    
    [ controller.window center ];
    [ controller showWindow: sender ];
    [ controller.window makeKeyAndOrderFront: sender ];
}

- ( IBAction )newDocument: ( id )sender
{
    ( void )sender;
    
    if(_mainWindowControllers.count > 0 )
    {
        [ self.activeMainWindowController newDocument: sender ];
    }
    else
    {
        [ self newWindow: sender ];
    }
}

- ( IBAction )openDocument: ( id )sender
{
    NSOpenPanel            * panel;
    __block CEMainWindowController * controller;
    
    if( _mainWindowControllers.count > 0 )
    {
        controller = self.activeMainWindowController;
        
        [ controller.window makeKeyAndOrderFront: sender ];
        [ controller showWindow: sender ];
        [ controller openDocument: sender ];
        
        return;
    }
    
    panel                                   = [ NSOpenPanel openPanel ];
    panel.allowsMultipleSelection           = NO;
    panel.canChooseDirectories              = NO;
    panel.canChooseFiles                    = YES;
    panel.canCreateDirectories              = NO;
    panel.treatsFilePackagesAsDirectories   = YES;
    panel.delegate                          = self;
    
    [ panel beginWithCompletionHandler: ^( NSInteger result )
     {
         if( result != NSFileHandlingPanelOKButton )
         {
             return;
         }
         
         controller                  = [ IDEMainWindowController new ];
         controller.activeDocument   = [ IDEDocument documentWithPath: [ panel.URL path ] ];
         
         [ _mainWindowControllers addObject: controller ];
         
         [ controller.window center ];
         [ controller showWindow: sender ];
         [ controller.window makeKeyAndOrderFront: sender ];
     }
     ];
}

- ( BOOL )application: ( NSApplication * )application openFile: ( NSString * )filename
{
    IDEMainWindowController * controller;
    IDEDocument             * document;
    
    ( void )application;
    
    document = [ IDEDocument documentWithPath: filename ];
    
    if( document.sourceFile.text == nil )
    {
        return NO;
    }
    
    if( _mainWindowControllers.count > 0 )
    {
        controller = self.activeMainWindowController;
    }
    else
    {
        controller = [ IDEMainWindowController new ];
        
        [ _mainWindowControllers addObject: controller ];
        [ controller.window center ];
    }
    
    [ controller setActiveDocument: document ];
    [ controller showWindow: nil ];
    [ controller.window makeKeyAndOrderFront: nil ];
    
    return YES;
}

- ( IBAction )resetColorThemes: ( id )sender
{
    NSString * path;
    
    ( void )sender;
    
    path = [ [ FILE_MANAGER applicationSupportDirectory ] stringByAppendingPathComponent: @"Themes" ];
    
    [ FILE_MANAGER removeItemAtPath: path error: NULL ];
    [ self installApplicationSupportFiles ];
}

@end
