//
//  NSFileManager+CE.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 02/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "NSFileManager+CE.h"

static NSString * __applicationSupportDirectory = nil;

static void __exit( void ) __attribute__( ( destructor ) );
static void __exit( void )
{
    [ __applicationSupportDirectory release ];
}

@implementation NSFileManager( IDE )

- ( NSString * )pathOfDirectory:    ( NSSearchPathDirectory )directory
                       inDomain:           ( NSSearchPathDomainMask )domain
                byAppendingPath:    ( NSString * )appendPath
              createIfNecessary:  ( BOOL )create
{
    NSArray  * paths;
    NSString * path;
    BOOL       status;
    
    paths = NSSearchPathForDirectoriesInDomains( directory, domain, YES );
    
    if( paths == nil || paths.count == 0 )
    {
        return nil;
    }
    
    path = [ paths objectAtIndex: 0 ];
    
    if( appendPath != nil && appendPath.length > 0 )
    {
        path = [ path stringByAppendingPathComponent: appendPath ];
    }
    
    if( create == YES )
    {
        status = [ self createDirectoryAtPath: path withIntermediateDirectories: YES attributes: nil error: NULL ];
        
        if( status == NO )
        {
            return nil;
        }
    }
    
    return path;
}

- ( NSString * )applicationSupportDirectory
{
    NSString * appName;
    NSError  * error;
    NSString * path;
    BOOL       isDir;
    
    if( __applicationSupportDirectory != nil )
    {
        return __applicationSupportDirectory;
    }
    
    isDir   = NO;
    error   = nil;
    appName = [ BUNDLE objectForInfoDictionaryKey: NSBundleInfoKeyCFBundleExecutable ];
    path    = [ self pathOfDirectory: NSApplicationSupportDirectory inDomain: NSUserDomainMask byAppendingPath: appName createIfNecessary: YES ];
    
    if( path == nil || path.length == 0 || [ FILE_MANAGER fileExistsAtPath: path isDirectory: &isDir ] == NO || isDir == NO )
    {
        return nil;
    }
    
    __applicationSupportDirectory = [ path copy ];
    
    return __applicationSupportDirectory;
}

@end
