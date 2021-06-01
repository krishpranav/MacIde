//
//  IDEApplicationDelegate+Private.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 01/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "IDEApplicationDelegate+Private.h"
#import "IDEPreferences.h"
#import "IDEColorTheme.h"
#import "IDEMainWindowController.h"


@implementation CEApplicationDelegate( Private )

- ( void )installApplicationSupportFiles
{
    void ( ^ installDir )( NSString * directory );
    
    installDir = ^( NSString * directory )
    {
        NSString * path;
        NSString * bundlePath;
        NSString * dirPath;
        
        path = [ FILE_MANAGER applicationSupportDirectory ];
        
        if( path == nil )
        {
            return;
        }
        
        bundlePath = [ BUNDLE pathForResource: directory ofType: nil ];
        dirPath    = [ path stringByAppendingPathComponent: [ bundlePath lastPathComponent ] ];
        
        if( [ FILE_MANAGER fileExistsAtPath: dirPath ] == NO )
        {
            [ FILE_MANAGER copyItemAtPath: bundlePath toPath: dirPath error: NULL ];
        }
    };
    
    installDir( @"Licenses" );
    installDir( @"Templates" );
    installDir( @"Themes" );
}

- ( void )firstLaunch
{
    if( [ [ CEPreferences sharedInstance ] firstLaunch ] == NO )
    {
        return;
    }
    
    [ [ CEPreferences sharedInstance ] setUserName: NSFullUserName() ];
    [ [ CEPreferences sharedInstance ] setTextEncoding: NSUTF8StringEncoding ];
    
    {
        NSDictionary * warningFlags;
        NSString     * warningFlag;
        NSNumber     * warningFlagValue;
        
        warningFlags = [ [ CEPreferences sharedInstance ] warningFlags ];
        
        if( warningFlags == nil || warningFlags.count == 0 )
        {
            warningFlags = [ [ CEPreferences sharedInstance ] warningFlagsPresetNormal ];
            
            for( warningFlag in warningFlags )
            {
                warningFlagValue = ( NSNumber * )[ warningFlags objectForKey: warningFlag ];
                
                if( [ warningFlagValue boolValue ] == YES )
                {
                    [ [ CEPreferences sharedInstance ] enableWarningFlag: warningFlag ];
                }
                else
                {
                    [ [ CEPreferences sharedInstance ] disableWarningFlag: warningFlag ];
                }
            }
        }
    }
    
    {
        CEColorTheme * theme;
        
        theme = [ CEColorTheme defaultColorThemeWithName: @"Codeine - Dark" ];
        
        [ [ CEPreferences sharedInstance ] setColorsFromColorTheme: theme ];
    }
}

- ( void )windowDidClose: ( NSNotification * )notification
{
    NSWindow           * window;
    NSWindowController * controller;
    
    window      = [ notification object ];
    controller  = window.windowController;
    
    if( [ controller isKindOfClass: [ CEMainWindowController class ] ] == YES )
    {
        [ _mainWindowControllers removeObject: controller ];
        [ controller autorelease ];
    }
}

- ( void )windowDidBecomeKey: ( NSNotification * )notification
{
    NSWindow           * window;
    NSWindowController * controller;
    
    window      = [ notification object ];
    controller  = window.windowController;
    
    if( [ controller isKindOfClass: [ CEMainWindowController class ] ] == YES && controller != _activeMainWindowController )
    {
        _activeMainWindowController = [ ( CEMainWindowController * )controller retain ];
    }
}

@end
