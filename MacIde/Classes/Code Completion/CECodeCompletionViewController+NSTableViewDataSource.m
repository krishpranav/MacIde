//
//  CECodeCompletionViewController+NSTableViewDataSource.m
//  MacIde
//
//  Created by Elangovan Ayyasamy on 03/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//


#import "CECodeCompletionViewController+NSTableViewDelegate.h"

@implementation CECodeCompletionViewController( NSTableViewDataSource )

- ( NSInteger )numberOfRowsInTableView: ( NSTableView * )tableView
{
    ( void )tableView;
    
    return ( NSInteger )( _results.count );
}

- ( id )tableView: ( NSTableView * )tableView objectValueForTableColumn: ( NSTableColumn * )tableColumn row: ( NSInteger )row
{
    CKCompletionResult * result;
    CKCompletionChunk  * chunk;
    
    ( void )tableView;
    ( void )tableColumn;
    
    @try
    {
        result = [ _results objectAtIndex: ( NSUInteger )row ];
        
        for( chunk in result.chunks )
        {
            if( chunk.kind == CKCompletionChunkKindTypedText )
            {
                return chunk.text;
            }
        }
    }
    @catch ( NSException * e )
    {
        ( void )e;
    }
    
    return nil;
}

@end
