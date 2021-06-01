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


@implementation IDEApplicationDelegate(Private)

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

@end
